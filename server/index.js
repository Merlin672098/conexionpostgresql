const express = require('express');
const authRouter = require('./routes/auth');
require('dotenv').config();

const http = require('http');
const url = require('url');
const cors = require('cors');

const PORT = process.env.PORT || 3000;
const app = express();
const server = http.createServer(app);

app.use(cors());
app.use(express.json());
app.use(authRouter); 


server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server listening on port ${PORT}`);
});
