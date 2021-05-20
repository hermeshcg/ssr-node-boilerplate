require('dotenv/config');

const path = require('path');
const express = require('express');
const exphbs = require('express-handlebars');
const AppError = require('./errors/AppError');

const app = express();
app.use(express.json());

app.set('view engine', 'handlebars');
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', exphbs({ defaultLayout: 'non-authenticated' }));

app.use(require('./routes'));

app.use((error, _request, response, _next) => {
  if (error instanceof AppError) {
    return response
      .status(error.statusCode)
      .json({ status: 'error', message: error.message });
  }

  console.error(error);

  return response
    .status(500)
    .json({ status: 'error', message: 'Internal server error' });
});

app.listen(3000, () => {
  console.log('🚀 server started!');
});
