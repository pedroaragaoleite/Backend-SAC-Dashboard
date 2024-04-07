import jwt from 'jsonwebtoken';
// import { pool } from '../db.js';
import User from '../models/Users/userModel.js';
import { sequelize } from '../db/db.js';
import { QueryTypes } from 'sequelize';

// Middleware to validate token
const authenticateToken = async (req, res, next) => {
    try {
        const accessToken = req.cookies.token;


        if (!accessToken) {
            return res.status(401).json({
                code: -50,
                message: 'There is no access token'
            });
        }

        const decodedToken = jwt.verify(accessToken, process.env.JWT_TOKEN);

        // Query the database for the user with the given ID
        const result = User.findOne()
        // await sequelize.query('SELECT id_role FROM roles WHERE role_name = ?', {replacements: [role] ,type: QueryTypes.SELECT });
        const user = await sequelize.query('SELECT * FROM users WHERE id_user = ?', { replacements: [decodedToken.id_user], type: QueryTypes.SELECT });

        if (!user) {
            return res.status(401).json({
                code: -70,
                message: 'Access token not valid'
            });
        }

        // If the user is found, attach it to the request object
        req.user = user;
        next();
    } catch (error) {
        console.error(error);
        res.status(500).json({
            code: -100,
            message: 'Something wrong happened in the token authentication'
        });
    }
};

export default authenticateToken;