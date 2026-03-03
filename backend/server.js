const express = require("express");

const app = express();
const PORT = 3000;

let tasks = [];

app.get("/tasks", (req, res) => {
  res.json(tasks);
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});