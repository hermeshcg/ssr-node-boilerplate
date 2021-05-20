const pgp = require('pg-promise')();

const database = pgp({
  user: process.env.DATABASE_USERNAME,
  password: process.env.DATABSE_PASSWORD,
  host: process.env.DATABSE_HOST,
  port: process.env.DATABSE_PORT,
  database: process.env.DATABSE_NAME,
});

module.exports = database;
