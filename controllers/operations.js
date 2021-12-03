const connection = require("../database/connection");

const userOperations = async (req, res) => {
  try {
    const { id } = req.params;
    const operations =
      await connection.query(`select o.id, u.id as userId , a.account_id, t.operation_type as type, o.quantity, o."currencyQuantity", 
    o.operation_date, o.category, o.description, a."holdersName" as accountName, a.number as accountNumber, a.bank as accountBank,
    c.currency
    from operation o 
    inner join operation_type t on t.operation_type_id  = o.operation_type 
    inner join account a on a.account_id  = o.account_id 
    inner join users u on u.id  = a.user_id
    inner join currency c on c.currency_id  = o.currency_id 
    where a.user_id = ${id}
    `);

    res.json({ ok: true, operations: operations.rows });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error getting operations " + error,
    });
  }
};

const addOperation = async (req, res) => {
  try {
    const {
      quantity,
      currencyQuantity,
      category,
      description,
      operation_type,
      account_id,
      currency_id,
    } = req.body;
    const operations = await connection.query(`insert into operation 
        (   quantity,
            "currencyQuantity",
            category,
            description,
            operation_type,
            account_id,
            currency_id
        )
        VALUES (
            ${quantity},
            ${currencyQuantity},
            '${category}',
            '${description}',
            ${operation_type},
            ${account_id},
            ${currency_id}
        )`);

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error inserting operation " + error,
    });
  }
};

const removeOperation = async (req, res) => {
  try {
    const { operationId } = req.body;
    const operations = await connection.query(
      `delete from operation where id = ${operationId}`
    );

    res.json({ ok: true });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error deleting operation " + error,
    });
  }
};

module.exports = {
  userOperations,
  addOperation,
  removeOperation,
};
