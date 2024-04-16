import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { validationResult } from 'express-validator';
import { serialize } from 'cookie';
import User from '../models/Users/userModel.js';
import UserRoles from '../models/Users/userRolesModel.js';
import { sequelize } from '../db/db.js';
import { QueryTypes } from 'sequelize';


export const loginUser = async (req, res) => {
  try {

    // check for validation
    const checkValidation = validationResult(req);

    if (!checkValidation.isEmpty()) {
      return res.status(400).json({ errors: validationResult.array() })
    }

    const { email, password } = req.body;

    // check for user by email
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({
        message: 'user doesnt exist...'
      });
    }

    // // check if the password is the same
    const passwordValid = await bcrypt.compare(password, user.password);
    if (!passwordValid) {
      return res.status(401).json({
        code: -5,
        message: 'Wrong credentials...'
      });
    }


    // create token

    const accessToken = jwt.sign({ id_user: user.id_user, name: user.username }, process.env.JWT_TOKEN);
    const token = serialize('token', accessToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 60 * 60 * 24 * 30,
      path: '/',
    });
    res.setHeader('Set-Cookie', token);

    res.json({
      code: 1,
      message: 'Login OK',
      data: {
        user: {
          name: user.username,
          role: user.role,
          id_user: user.id_user
        }
      },
      token
    })


  } catch (error) {
    console.error(error);
    res.status(500).json({
      code: -100,
      message: 'Error on login',
      error: error
    });
  }

}

export const registerUser = async (req, res) => {
  console.log(req.body);
  try {
    const checkValidation = validationResult(req);
    if (!checkValidation.isEmpty) {
      return res.status(400).json({ errors: checkValidation.array() })
    }
    // console.log(req.body);
    const { username, email, password, role } = req.body;
    console.log("firsto backend log", email);

    // check for existing email 
    const existEmail = await User.findOne({ where: { email } });
    console.log("Existing email: ", existEmail);
    if (existEmail) {
      return res.status(400).json({
        message: 'Email already registered...'
      });
    };


    // check for existing username
    // const existUser = User.findOne({ where: { username } });
    // if (existUser) {
    //   return res.status(400).json({
    //     message: 'Username already used...'
    //   });
    // };

    // passworod hash
    const password_hash = await bcrypt.hash(password, 10);


    // console.log(email);
    // insert user
    const newUser = await User.create({ email, password: password_hash, username, role });

    await newUser.save()

    // insert for roles
    const [result] = await sequelize.query('SELECT id_role FROM roles WHERE role_name = ?', { replacements: [role], type: QueryTypes.SELECT });


    if (!result) {
      throw new Error('Role dont exist');
    }

    // insert into user_roles
    const newUserRoles = await UserRoles.create({ id_user: newUser.id_user, role_id: result.id_role })
    await newUserRoles.save();

    const accessToken = jwt.sign({ id_user: newUser.id_user, name: newUser.username }, process.env.JWT_TOKEN);
    const token = serialize('token', accessToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 60 * 60 * 24 * 30,
      path: '/',
    });
    res.setHeader('Set-Cookie', token);

    // Enviar una respuesta al cliente
    res.status(200).json({
      message: 'User registered with success',
      token
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error creating user',
      error: error,
    });
  }
}



export const logOut = async (req, res) => {

  const { cookies } = req;

  const jwt = cookies.token;



  const token = serialize('token', null, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'strict',
    maxAge: -1,
    path: '/',
  });

  res.setHeader('Set-Cookie', token);

  res.status(200).json({
    code: 0,
    message: 'Logged out - Delete Token',
    token
  });
}


export const isLogged = (req, res) => {

  res.send({ message: "Your are logged in", user: req.user })
}