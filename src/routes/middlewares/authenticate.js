const AppError = require('../../errors/AppError');

function verifyUserToken(req, res, next) {
  let token = req.headers.authorization;
  if (!token) throw new AppError('missing-JWT');

  try {
    token = token.split(' ')[1];
    if (token === 'null' || !token) throw new AppError('missing-JWT');

    let verifiedUser = jwt.verify(token, process.env.TOKEN_SECRET);
    if (!verifiedUser) throw new AppError('authentication-fail');

    req.user = verifiedUser;
    next();
  } catch (error) {
    throw new AppError('invalid-JWT');
  }
}

module.exports = verifyUserToken;
