const { Router } = require("express");
const { check } = require("express-validator");
const {
  userAccounts,
  linkAccount,
  updateAccount,
  unLinkAccount,
} = require("../controllers/account");
const { login, test, register, update } = require("../controllers/auth");
const { validateFields } = require("../middlewares/validateFields");
const { validateJWT } = require("../middlewares/validateJWT");

const router = Router();

router.get(
  "/userAccounts/:id",
  [
    check("id").not().isEmpty(),
    //check("password").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  userAccounts
);

router.post(
  "/linkAccount",
  [
    check("bank").not().isEmpty(),
    check("number").not().isEmpty(),
    check("account_type").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  linkAccount
);

router.put(
  "/updateAccount",
  [
    check("bank").not().isEmpty(),
    check("number").not().isEmpty(),
    check("account_type").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  updateAccount
);

router.delete(
  "/unlinkAccount",
  [
    check("account_id").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  unLinkAccount
);
module.exports = router;
