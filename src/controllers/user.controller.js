import { validationResult } from "express-validator";
import User from "../models/Users/userModel.js";
import Role from "../models/Users/rolesModel.js";
import bcrypt from 'bcrypt';
import UserRoles from '../models/Users/userRolesModel.js';
import Todo from '../models/todo/todoModel.js';
import { sequelize } from '../db/db.js';
import { QueryTypes } from 'sequelize';


export const updateUser = async (req, res) => {
    try {
        const checkValidation = validationResult(req);
        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() })
        }

        const id = req.params.id;
        const { username, email, role } = req.body;
        // const password_hash = await bcrypt.hash(password, 10);

        await User.update({ email, username, role }, { where: { id_user: id } });


        const [result] = await sequelize.query('SELECT id_role FROM roles WHERE role_name = ?', { replacements: [role], type: QueryTypes.SELECT });
        if (!result) {
            throw new Error('Role dont exist');
        }
        const id_role = result.id_role;

        // insert into user_roles
        await UserRoles.upsert({ id_user: id, role_id: id_role });



        res.status(200).json({
            message: "User updated with success",
        })

    } catch (error) {
        console.error(error),
            res.status(500).json({
                message: "Error updating user",
                error: error
            })
    }
}

export const deleteUser = async (req, res) => {
    try {
        const id_user = req.params.id;

        const task = await Todo.findOne({ where: { user_id: id_user } })

        if (task) {
            return res.status(500).json({
                message: "Error deleting the user, there is a task assigned to the user"
            })
        };


        await User.destroy({ where: { id_user: id_user } });


        res.status(200).json({ message: "User deleted!" })
    } catch (error) {
        console.error(error),
            res.status(500).json({
                message: "Error deleting user",
                error: error
            })
    }
}


export const getUsers = async (req, res) => {
    try {
        const users = await User.findAll();

        if (users.length === 0) {
            return res.status(404).json({ message: 'No users found' });
        }

        res.status(200).json({
            message: 'Users list',
            data: users
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong fetching users',
        });
    }
}

export const getOutboundUsers = async (req, res) => {
    try {

        const outboundUsers = await User.findAll({ where: { role: 'Outbound' } });

        res.status(200).json({
            message: "Outbound users list",
            data: outboundUsers
        })

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Something went wrong fetching users"
        })
    }
}

export const getUser = async (req, res) => {
    try {
        const checkValidation = validationResult(req);
        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() });
        }

        const id_user = req.params.id;
        const user = await User.findOne({ where: { id_user } });
        if (!user) {
            res.status(404).json({ message: 'No user found!' });
        }



        res.status(200).json({
            message: 'User found!',
            data: {
                id: id_user,
                name: user.username,
                email: user.email,
                role: user.role
            }
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong searching user',
        });
    }
}
export const getUserByEmail = async (req, res) => {
    try {
        const checkValidation = validationResult(req);
        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() });
        }


        const email = req.params.email;
        console.log(email);
        const user = await User.findOne({ where: { email: email } });
        if (!user) {
            return res.status(200).json({ message: 'No user found!' });
        }




        res.status(200).json({
            message: 'User found!',
            data: user
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong searching user',
        });
    }
}

export const getRoles = async (req, res) => {
    try {
        const roles = await Role.findAll();
        if (roles.length === 0) {
            return res.status(404).json({ message: 'No roles found' });
        }

        res.status(200).json({
            message: 'Roles list',
            roles
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong fetching users',
        });
    }
}