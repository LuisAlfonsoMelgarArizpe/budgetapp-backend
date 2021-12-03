const { Model, DataTypes, Sequelize } = require("sequelize");
const sequelize = require("../database/db");
const Account = require("./Account");

class Operation extends Model {}

Operation.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    quantity: DataTypes.FLOAT,
    currency_cuantity: DataTypes.FLOAT,
    operation_date: {
      type: DataTypes.DATE,
      defaultValue: Sequelize.NOW,
    },
    category: DataTypes.STRING,
    description: DataTypes.STRING,
  },
  {
    sequelize,
    modelName: "operation",
    timestamps: false,
    freezeTableName: true,
  }
);

module.exports = Operation;
