const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");

class Currency extends Model {}

Currency.init(
  {
    currency_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    currency: DataTypes.STRING,
    rate: DataTypes.FLOAT,
  },
  { sequelize, modelName: "currency", timestamps: false, freezeTableName: true }
);

module.exports = Currency;
