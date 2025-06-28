const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Group Rehearsal Scheduler API running');
});

// More REST endpoints coming soon

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});