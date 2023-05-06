# Socket.IO Server

This is a Socket.IO server built using Express and PrismaClient. It allows users to vote on a debate and see the updated voting results in real-time.

## Installation

To install the necessary dependencies, run the following command:
- npm install

## Available Scripts

In the project directory, you can run:

### `npm run devStart`

Runs the app in the development mode using nodemon.<br />
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

### `npm run build`

Builds the app for production to the `dist` folder.<br />

### `npm start`

Runs the app in the production mode using node.<br />
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

## API

### Socket.IO Events

#### `connection`

This event is fired when a new socket connection is established. It sends the voting results for the debate to the connected client.

#### `vote`

This event is fired when a user votes on the debate. It updates the voting results for the debate and sends the updated results to all connected clients.

### Database Schema

The following tables are used in the database schema:

#### `tbl_debate_request`

- `id`: The unique ID of the debate request.
- `debateId`: The ID of the debate.
- `userRefTo`: The user ID of the debater.

#### `tbl_debaterVote`

- `id`: The unique ID of the vote.
- `debateId`: The ID of the debate.
- `voteBy`: The user ID of the user who voted.
- `voteTo`: The user ID of the debater who was voted for.
- `created_at`: The timestamp when the vote was created.
- `updated_at`: The timestamp when the vote was last updated.

## Dependencies

| Dependency         | Purpose                                                     |
| ------------------ | ----------------------------------------------------------- |
| @prisma/client     | Prisma client for database access and ORM                    |
| cors               | Cross-origin resource sharing middleware                     |
| dotenv             | Loads environment variables from a .env file                 |
| express            | Web application framework                                    |
| helmet             | Helps secure Express apps with various HTTP headers          |
| morgan             | HTTP request logger middleware                               |
| socket.io          | Enables real-time, bidirectional and event-based communication between the browser and the server |
| winston            | Logging library for Node.js                                  |

## Dev Dependencies

| Dependency         | Purpose                                                     |
| ------------------ | ----------------------------------------------------------- |
| @types/express     | Type definitions for the Express library                     |
| @types/jest        | Type definitions for Jest testing framework                  |
| @types/node        | Type definitions for the Node.js runtime                      |
| jest               | Testing framework                                            |
| nodemon            | Development server that automatically restarts the server on file changes |
| prisma             | Database ORM and query builder                               |
| ts-node            | TypeScript execution environment and REPL                    |
| typescript         | Programming language for large-scale JavaScript applications |

## Configuration

The server reads environment variables from a `.env` file using the `dotenv` package. Required variables are:

- `DATABASE_URL`: a URL to connect to the PostgreSQL database
- `PORT`: the port to listen on for incoming HTTP requests



