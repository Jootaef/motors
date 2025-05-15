const express = require('express');
const router = express.Router();

// Página principal
router.get('/', (req, res) => {
  res.render('index');
});

// Página para crear una imagen
router.get('/create-image', (req, res) => {
  res.render('create-image');
});

module.exports = router;
