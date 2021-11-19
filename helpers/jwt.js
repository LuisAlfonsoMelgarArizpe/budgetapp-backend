const { sign } = require("jsonwebtoken");

const generateJWT = (id, email) => {
  return new Promise((resolve, reject) => {
    const payload = { id, email };
    sign(
      payload,
      process.env.SECRET_JWT_SEED,
      {
        expiresIn: "2h",
      },
      (err, token) => {
        if (err) {
          console.log(err);
          reject("Error generating token");
        } else {
          resolve(token);
        }
      }
    );
  });
};

module.exports = {
  generateJWT,
};
