import dotenv from "dotenv";
dotenv.config();
import express from "express";
import { PrismaClient } from "@prisma/client";
import http from "http";
import { Server } from "socket.io";
const app = express();

const prisma = new PrismaClient();

async function main() {
  
  // const user = await prisma.user.create({
  //     data: {
  //     name:"Akash"
  //     }
  // })
  // console.log(user)
  const PORT = process.env.PORT || 8000;
  const server = http.createServer(app);
  const socket = new Server(server);

  server.listen(PORT, () => {
    console.log("Server started");
  });

  socket.on("connection", function (socketParams) {
    console.log("Made socket connection");
  });
}

main()
  .catch((e) => {
    console.log(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
