const express = require('express');
const router = express.Router();

// Página principal
router.get('/', (req, res) => {
  res.render('index'); // Esto renderiza views/index.ejs
});

module.exports = router;
