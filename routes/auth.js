const { Router } = require("express");
const { check } = require("express-validator");
const { login } = require("../controllers/auth");
const { validateFields } = require("../middlewares/validateFields");

const router = Router();

router.get(
  "/login",
  [
    /*check("user").not().isEmpty()
    ,validateFields*/
  ],
  login
);

module.exports = router;
