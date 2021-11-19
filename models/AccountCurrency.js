const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");
const AccountType = require("./AccountType");
const User = require("./User");

class AccountCurrency extends Model {}

AccountCurrency.init(
  {
  },
  { sequelize, modelName: "account_currency", timestamps: false, freezeTableName: true }
);
 //sets AccountType id on Account


module.exports = AccountCurrency;
