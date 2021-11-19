const { Model, DataTypes, Sequelize } = require("sequelize");
const sequelize = require("../database/db");
const Account = require("./Account");

class User extends Model {}

User.init(
  {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    register_date: { type: DataTypes.DATE, defaultValue: Sequelize.NOW },
  },
  { sequelize, modelName: "users", timestamps: false }
);

module.exports = User;
