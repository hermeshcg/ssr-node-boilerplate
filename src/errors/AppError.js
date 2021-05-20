const errors = require('./errors');

class AppError {
  message;
  statusCode;

  constructor(error) {
    const { message, status } = errors[error];
    this.message = message;
    this.statusCode = status;
  }
}

module.exports = AppError;
