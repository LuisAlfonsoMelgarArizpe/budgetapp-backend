const { response, request } = require("express");
const { verify } = require("jsonwebtoken");

const validateJWT = (req = request, res = response, next) => {
  try {
    const token = req.header("x-token");

    if (!token) {
      return res.status(401).json({
        ok: false,
        msg: "There is no token on the request",
      });
    }

    const { id, email, iat, exp } = verify(token, process.env.SECRET_JWT_SEED); //{uid,name}:payload, iat: issued at date, exp:expire date
    console.log(`Token verified for ${id} ${email} iat ${iat} exp : ${exp} `);
    req.id = id;
    req.email = email;
  } catch (error) {
    console.log(error);
    return res.status(401).json({
      ok: false,
      msg: "Invalid token",
    });
  }

  next();
};

module.exports = { validateJWT };
