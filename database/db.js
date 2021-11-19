const { Sequelize } = require("sequelize");

console.log(process.env.PGCONNECTIONSTRING);

const sequelize = new Sequelize(process.env.PGCONNECTIONSTRING, {
  dialect: "postgres",
});

sequelize
  .authenticate()
  .then(() => {
    console.log("DB online");
  })
  .catch((error) => {
    console.log(error);
    throw new Error("Error connecting to DB");
  });

module.exports = sequelize;
