const Currency = require("../models/Currency");

const getAllCurrencies = async (req, res) => {
  try {
    const currencies = await Currency.findAll();

    return res.json(currencies);
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      ok: false,
      message: "Error currencies " + error,
    });
  }
};

module.exports = { getAllCurrencies };
