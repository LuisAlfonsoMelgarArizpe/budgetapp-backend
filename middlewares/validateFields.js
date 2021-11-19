const { response } = require("express");
const { validationResult } = require("express-validator");

const validateFields = (req, res = response, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(200).json({
      ok: false,
      validationErrors: errors.array(),
      msg: errors.array()[0].msg + " for " + errors.array()[0].param,
    });
  }

  next();
};

module.exports = {
  validateFields,
};
