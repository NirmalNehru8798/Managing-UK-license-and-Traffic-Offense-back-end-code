// import http from "http";
// import app from "./app";
const http = require('http');
const express = require('express');
const app = require('./app');
//Use system configuration for port or use 6001 by default.
const port = 5000;

//Create server with exported express app
const server = http.createServer(app);
server.listen(port);
