const express = require('express');
const router = express.Router();

router.get('/', async (req, res, next) => {
  try {
    res.render('pages/public/home.handlebars');
  } catch (error) {
    next(error);
  }
});

module.exports = router;
