const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");

class Category extends Model {}

Category.init(
  {
    category_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    category: DataTypes.STRING,
  },
  { sequelize, modelName: "category", timestamps: false, freezeTableName: true }
);

module.exports = Category;
