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
      include: [
        {
          model: AccountType,
          as: "type",
          attributes: ["type"],
        },
        {
          model: Currency,
          as: "currencies",
          attributes: ["currency", "rate"],
        },
        {
          model: User,
          as: "user",
          attributes: ["name"],
        },
      ],
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

const linkAccount = async (req, res) => {
  try {
    const { bank, number, user_id, account_type, holdersName, currencies } =
      req.body;
    const account = await connection.query(
      `INSERT INTO account ("bank", "number", "user_id", "account_type", "holdersName" ) 
        VALUES ('${bank}',${number}, ${user_id}, ${account_type},'${holdersName}') RETURNING account_id`
    );

    console.log(account);

    currencies.forEach(async (currency) => {
      const query = await connection.query(
        `INSERT INTO account_currency 
        VALUES (${account.rows[0].account_id},${currency})`
      );
    });

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error linkin account " + error,
    });
  }
};

const updateAccount = async (req, res) => {
  try {
    const {
      account_id,
      bank,
      number,
      user_id,
      account_type,
      holdersName,
      currencies,
    } = req.body;
    const account = await connection.query(
      `UPDATE account set bank = '${bank}', number = ${number}, account_type = ${account_type}, "holdersName" = '${holdersName}' where account_id = ${account_id}`
    );

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error updating account " + error,
    });
  }
};

const unLinkAccount = async (req, res) => {
  try {
    const { account_id } = req.body;
    const account = await connection.query(
      `DELETE from account where account_id = ${account_id}`
    );

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error unlinking account " + error,
    });
  }
};

module.exports = {
  userAccounts,
  linkAccount,
  updateAccount,
  unLinkAccount
};
