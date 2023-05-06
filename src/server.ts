import dotenv from "dotenv";
dotenv.config();
import express from "express";
import { PrismaClient } from "@prisma/client";
import http from "http";
import { Server } from "socket.io";
const app = express();
const cors = require("cors");
const prisma = new PrismaClient();

async function main() {
  app.use(cors());



  const PORT = process.env.PORT || 8000;
  const server = http.createServer(app);
  const socketserver = new Server(server, {
    cors: {
      origin: "http://localhost:5173",
    },
  });

  server.listen(PORT, () => {
    console.log("Server started");
  });

  socketserver.on("connection", async function (socket) {
    try {
      console.log("Made socket connection");

      if (socket.handshake.query.debateId) {
        const debateUsers = await prisma.tbl_debate_request.findMany({
          where: {
            debateId: Number(socket.handshake.query.debateId),
          },
          select: {
            userRefTo: true,
          },
        });

        let votingResult: any[] = []; 

        const resultLoader = debateUsers.map(async (user: any) => {
          const count = await prisma.tbl_debaterVote.count({
            where: {
              debateId: Number(socket.handshake.query.debateId),
              voteTo: user.userRefTo,
            },
          });

          votingResult = [
            ...votingResult,
            {


              user: user.userRefTo,
              votes: count,
            },
          ];
        });
        await Promise.all(resultLoader);

        
        socketserver.emit("debateResult", votingResult);
 
      }
      socket.on("vote", async (data) => {
         
         // Increase the vote at index
         data.created_at = new Date();
         data.updated_at = new Date();
         await prisma.tbl_debaterVote.create({
           data: data,
         });
     const debateUsers = await prisma.tbl_debate_request.findMany({
       where: {
         debateId: Number(socket.handshake.query.debateId),
       },
       select: {
         userRefTo: true,
       },
     });

     let votingResult: any[] = [];

     const resultLoader = debateUsers.map(async (user:any) => {
       const count = await prisma.tbl_debaterVote.count({
         where: {
           debateId: data.debateId,
           voteTo: user.userRefTo,
         },
       });

       votingResult = [
         ...votingResult,
         {
           user: user.userRefTo,
           votes: count,
         },
       ];
     });
     await Promise.all(resultLoader);
         // Show the candidates in the console for testing
         console.log(votingResult);

         // Tell everybody else about the new vote
         socketserver.emit("debateResult", votingResult);
       });

    } catch (error: any) {
      console.log(error.message);
    }

    //   socket.on('disconnect', () => {
    //   socket.disconnectSockets()
    //   console.log('🔥: A user disconnected');
    // });
  });
}

main()
  .catch((e) => {
    console.log(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
// INSERT INTO`tbl_debate`(`id`, `userRef`, `meetingId`, `topic`, `title`, `message`, `areaLimit`, `isPublic`, `hostLive`, `coverImage`, `date`, `time`, `debateDuration`, `requestedUsers`, `created_at`, `updated_at`) VALUES(NULL, '9JJoNxfotXuJ2', '12', 'Testing', 'Testing', 'Testing', '5', '1', '1', '', '2022-12-24', '47:26:29', '46:26:29', 'testing', '2022-12-24 14:26:29', '2022-12-24 14:26:29');
// INSERT INTO `tbl_debaterVote` (`id`, `debateId`, `voteBy`, `voteTo`, `created_at`, `updated_at`) VALUES (NULL, '1', '9JJoNxfotXuJ2', '8f71g6c86LNdk', '2022-12-24 14:31:33', '2022-12-24 14:31:33');