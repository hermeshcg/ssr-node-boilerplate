const errors = {
  'missing-JWT': {
    status: 401,
    message: 'Erro, token JWT não enviado!',
  },
  'invalid-JWT': {
    status: 401,
    message: 'Erro, token JWT invalido!',
  },
  'authentication-fail': {
    status: 401,
    message: 'Erro, combinação e-mail/senha incorreta!',
  },
};

module.exports = errors;
