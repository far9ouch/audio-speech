const { createProxyMiddleware } = require('http-proxy-middleware');
const express = require('express');
const serverless = require('serverless-http');

const app = express();

// Proxy all requests to Flask backend
app.use('/.netlify/functions/api', createProxyMiddleware({
  target: 'http://localhost:5000',
  changeOrigin: true,
}));

// Handle Flask routes
app.all('*', createProxyMiddleware({
  target: 'http://localhost:5000',
  changeOrigin: true,
}));

module.exports.handler = serverless(app); 