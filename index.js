const express = require("express");
const cors = require("cors");
require("dotenv").config();

const sequelize = require("./database/db.js");
require("./models/Assosiations");

const app = express();

app.use(express.static("public"));

app.use(cors());

app.use(express.json());

/* app.use('/api/auth', require('./routes/auth.js'))

app.use('/api/events', require('./routes/events.js'))
 */

app.use("/auth", require("./routes/auth"));

app.use("/account", require("./routes/account"));

app.use("/currency", require("./routes/currency"));

app.use("/operations", require("./routes/operations"));

app.listen(process.env.PORT, async () => {
  console.log(`Server up on port ${process.env.PORT} `);

  // Create database
  try {
    //const sync = await sequelize.sync({ force: false });
    console.log("Database sync");
  } catch (error) {
    console.log("Coulnd't sync db " + error);
  }
});
