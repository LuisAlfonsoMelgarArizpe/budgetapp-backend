const { genSaltSync, hashSync, compareSync } = require("bcryptjs");
const connection = require("../database/connection");
const { generateJWT } = require("../helpers/jwt");
const Account = require("../models/Account");
const Category = require("../models/Category");
const User = require("../models/User");

const test = async (req, res) => {
  res.json({ ok: true, message: "TEST" });
};

const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({
      where: { email },
      include: {
        model: Category,
        as: "categories",
        attributes: ["category_id", "category"],
      },
    });

    if (!user)
      return res.status(404).json({
        ok: false,
        message: "Couldn't find a user with provided email. Please try again!",
      });

    const validPassword = compareSync(password, user.password);
    if (!validPassword) {
      return res.status(400).json({
        ok: false,
        message: `Incorrect password for ${email}. Please try again!`,
      });
    }

    const token = await generateJWT(
      user.getDataValue("id"),
      user.getDataValue("email")
    );

    res.json({ ok: true, user, token });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      ok: false,
      message: "Error loggin in " + error,
    });
  }
};

const register = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    let user = await User.findOne({ where: { email } });

    if (user) {
      return res.status(400).json({
        ok: false,
        msg: `There is already a User with email ${email}`,
      });
    }

    const salt = genSaltSync();

    const new_password = hashSync(password, salt);

    const newUser = await User.create({
      name,
      email,
      password: new_password,
    });
    console.log(newUser);

    const token = await generateJWT(
      newUser.getDataValue("id"),
      newUser.getDataValue("email")
    );
    return res.json({ ok: true, newUser, token });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error registering user " + error,
    });
  }
};

const renewToken = async (req, res) => {
  try {
    const { id, email } = req;

    const token = await generateJWT(id, email);

    res.json({
      ok: true,
      message: "token renew",
      token,
      id,
      email,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error renewing token",
    });
  }
};

const update = async (req, res) => {
  try {
    const { id, name, email, password } = req.body;
    const updatedUser = await User.update(
      {
        name,
        email,
        password,
      },
      { where: { id } }
    );

    res.json({ ok: true, updatedUser });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error updating user " + error,
    });
  }
};

const addCategory = async (req, res) => {
  try {
    const { user_id, category } = req.body;
    const user = await User.findByPk(user_id);

    const new_category = await Category.create({
      category,
      user_id: user.getDataValue("id"),
    });
    res.json({ ok: true, new_category });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error adding category " + error,
    });
  }
};

const removeCategory = async (req, res) => {
  try {
    const { category_id } = req.body;
    const category = await Category.findByPk(category_id);
    if (!category) {
      return res.status(404).json({
        ok: false,
        message: `Couldn't find category identified by id ${category_id}`,
      });
    }
    const old_category = await category.destroy();
    res.json({ ok: true, old_category });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      message: "Error removing category " + error,
    });
  }
};

module.exports = {
  test,
  login,
  register,
  update,
  addCategory,
  removeCategory,
  renewToken,
};
