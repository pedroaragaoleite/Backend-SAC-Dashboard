import { body } from 'express-validator';

export const loginValidator = [
    body('email').isEmail().withMessage('Provide valid email')
        .trim()
        .normalizeEmail(),
    body('password')
        .exists()
        .withMessage('Password is required')
        .isString()
        .withMessage('Password should be a string')
        .isLength({ min: 6 })
        .withMessage('Password should be at least 6 characters')
]

export const registerValidator = [
    body('username')
        .exists()
        .withMessage('Username is required')
        .isString()
        .withMessage('Username should be a string')
        .isLength({ min: 4 })
        .withMessage('Username should be at least 4 characters')
        .trim(),
    body('email').isEmail().withMessage('Provide valid email')
        .trim()
        .normalizeEmail(),
    body('password')
        .exists()
        .withMessage('Password is required')
        .isString()
        .withMessage('Password should be a string')
        .isLength({ min: 8 })
        .withMessage('Password shoud be at least 8 characters')
        .matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/)
        .withMessage('Password must include uppercase, lowercase, and numeric characters')
    // body('option')
    //     .exists().withMessage('Option is required')
    //     .isString().withMessage('Option should be a string')
    //     .trim(),
]

export const updateValidator = [
    body('username')
        .exists()
        .withMessage('Username is required')
        .isString()
        .withMessage('Username should be a string')
        .isLength({ min: 4 })
        .withMessage('Username should be at least 4 characters')
        .trim(),
    body('email').isEmail().withMessage('Provide valid email')
        .trim()
        .normalizeEmail()
]