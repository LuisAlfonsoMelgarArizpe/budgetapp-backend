const Account = require("./Account");
const AccountCurrency = require("./AccountCurrency");
const AccountType = require("./AccountType");
const Category = require("./Category");
const Currency = require("./Currency");
const Operation = require("./Operation");
const OperationType = require("./OperationType");
const User = require("./User");


// User Categories
User.hasMany(Category, { as: "categories", foreignKey: "user_id" });

// Account Table
Account.belongsTo(User, { as: "user", foreignKey: "user_id" }); // Adds user_id fk on Account
Account.belongsTo(AccountType, { as: "type", foreignKey: "account_type" });
//AccountType.hasMany(Account, {as:"type", foreignKey : "account_type"} ) // Adds account_type_id fk Account

// Account Currencies
Account.belongsToMany(Currency, { through: AccountCurrency , timestamps:false});

//Opeartion Type
Operation.belongsTo(OperationType, {as:"type", foreignKey:"operation_type"})

// Operation Account
Account.hasMany(Operation,{as:"operations", foreignKey:"account_id"})

// Operation Currency
Currency.hasMany(Operation,{as:"operation_currency", foreignKey:"currency_id"})