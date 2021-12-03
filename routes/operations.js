const { Router } = require("express");
const { check } = require("express-validator");
const { userOperations, addOperation, removeOperation } = require("../controllers/operations");

const { validateFields } = require("../middlewares/validateFields");
const { validateJWT } = require("../middlewares/validateJWT");

const router = Router();

router.get(
  "/userOperations/:id",
  [
    check("id").not().isEmpty(),
    //check("password").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  userOperations
);

router.post(
  "/addOperation",
  [
    check("quantity").not().isEmpty(),
    //check("password").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  addOperation
);

router.delete(
  "/removeOperation",
  [
    check("operationId").not().isEmpty(),
    //check("password").not().isEmpty(),
    validateJWT,
    validateFields,
  ],
  removeOperation
);


module.exports = router;
