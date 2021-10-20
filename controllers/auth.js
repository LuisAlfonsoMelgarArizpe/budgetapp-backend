const connection = require("../database/connection");

const login = async (req, res) => {
  try {
    const { rowCount, rows } = await connection.query(`SELECT * FROM test`, []);
    console.log(`Query found ${rowCount} rows`);

    rows.map((row) => {
      console.log(`Found : ${row.test}`);
    });

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error loggin in",
    });
  }
};

module.exports = {
  login,
};
