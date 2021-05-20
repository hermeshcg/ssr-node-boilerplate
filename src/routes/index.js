const express = require('express');
const router = express.Router();
const authenticateMiddleware = require('./middlewares/authenticate');

router.use('/', require('./pages/public.routes'));

router.use(authenticateMiddleware);

router.use('/api/auth', require('./api/authentication.routes'));

module.exports = router;
