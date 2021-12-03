const { Router } = require("express");
const { getAllCurrencies } = require("../controllers/currency");
const { validateJWT } = require("../middlewares/validateJWT");

const router = Router();

router.get("/", [validateJWT], getAllCurrencies);

module.exports = router;
