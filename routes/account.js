const { Router } = require("express");
const { check } = require("express-validator");
const { userAccounts } = require("../controllers/account");
const { login, test, register, update } = require("../controllers/auth");
const { validateFields } = require("../middlewares/validateFields");

const router = Router();

router.get(
  "/userAccounts/:id",
  [
    check("id").not().isEmpty(),
    //check("password").not().isEmpty(),
    validateFields,
  ],
  userAccounts
);

module.exports = router;
