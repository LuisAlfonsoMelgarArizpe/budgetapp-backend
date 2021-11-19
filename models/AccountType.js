const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");
const Account = require("./Account");

class AccountType extends Model {}

AccountType.init(
  {
    account_type_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    type: DataTypes.STRING,
  },
  { sequelize, modelName: "account_type", timestamps: false, freezeTableName: true }
);



module.exports = AccountType;
