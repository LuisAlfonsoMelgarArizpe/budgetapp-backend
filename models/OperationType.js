const { Model, DataTypes, Sequelize } = require("sequelize");
const sequelize = require("../database/db");
const Account = require("./Account");

class OperationType extends Model {}

OperationType.init(
  {
    operation_type_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    operation_type: DataTypes.STRING,
  },
  { sequelize, modelName: "operation_type", timestamps: false,  freezeTableName: true }
);

module.exports = OperationType;
