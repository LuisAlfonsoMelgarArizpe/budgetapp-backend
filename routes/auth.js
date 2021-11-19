const { Router } = require("express");
const { check } = require("express-validator");
const {
  login,
  test,
  register,
  update,
  addCategory,
  removeCategory,
  renewToken,
} = require("../controllers/auth");
const { validateFields } = require("../middlewares/validateFields");
const { validateJWT } = require("../middlewares/validateJWT");

const router = Router();

router.get("/test", test);

router.post(
  "/login",
  [
    check("email").not().isEmpty().isEmail(),
    check("password").not().isEmpty(),
    validateFields,
  ],
  login
);

router.post(
  "/register",
  [
    check("name").not().isEmpty(),
    check("email").not().isEmpty().isEmail(),
    check("password").not().isEmpty(),
    validateFields,
  ],
  register
);

router.post(
  "/addCategory",
  [
    check("user_id").not().isEmpty(),
    check("category").not().isEmpty(),
    validateFields,
  ],
  addCategory
);

router.delete(
  "/removeCategory",
  [check("category_id").not().isEmpty(), validateFields],
  removeCategory
);

router.put(
  "/update",
  [
    /* check("name").not().isEmpty(),
    check("email").not().isEmpty().isEmail(),
    check("password").not().isEmpty(),
    validateFields, */
  ],
  update
);

router.get(
  "/renewToken",
  [
    validateJWT,
  ],
  renewToken
);

module.exports = router;
