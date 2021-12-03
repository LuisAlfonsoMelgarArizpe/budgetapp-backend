const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");
const AccountType = require("./AccountType");
const User = require("./User");

class Account extends Model {}

Account.init(
  {
    account_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    bank: DataTypes.STRING,
    number: DataTypes.STRING,
    holdersName : DataTypes.STRING
  },
  { sequelize, modelName: "account", timestamps: false, freezeTableName: true }
);
 //sets AccountType id on Account


module.exports = Account;
