const connection = require("../database/connection");
const Account = require("../models/Account");
const AccountType = require("../models/AccountType");
const Currency = require("../models/Currency");
const User = require("../models/User");

const userAccounts = async (req, res) => {
  try {
    const { id } = req.params;
    const accounts = await Account.findAll({
      where: { user_id: id },
      include: {
        model: AccountType,
        as: "type",
        attributes: ["type"],
      },
      include: {
        model: Currency,
        as: "currencies",
        attributes: ["currency", "rate"],
      },
    });

    res.json({ ok: true, accounts });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error loggin in " + error,
    });
  }
};

module.exports = {
  userAccounts,
};
