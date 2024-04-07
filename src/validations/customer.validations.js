import { body } from "express-validator";

export const customerValidator = [
    body('name')
        .exists().withMessage('Username is required')
        .isString().withMessage('Username should be a string')
        .isLength({ min: 4 }).withMessage('Username should be at least 4 characters')
        .trim(),
    body('email')
        .isEmail().withMessage('Provide valid email')
        .trim()
        .normalizeEmail(),
    body('address')
        .exists().withMessage('Address is required')
        .isString().withMessage('Address should be a string')
        .isLength({ min: 10 }).withMessage('Address should be at least 10 characters')
        .isLength({ max: 200 }).withMessage('Address should not have more than 200 characters')
        .trim(),
    body('city')
        .exists().withMessage('City is required')
        .isString().withMessage('City should be a string')
        .isLength({ min: 3 }).withMessage('City should be at least 3 characters')
        .trim(),
    body('postal_code')
        .exists().withMessage('Postal code is required')
        .isNumeric().withMessage('Postal code should contain only numbers')
        .isLength({ min: 5 }).withMessage('Postal code should be at least 5 characters')
        .isLength({ max: 5 }).withMessage('Postal code should not have more than 5 characters')
        .matches(/^(0[1-9]|[1-4][0-9]|5[0-2])\d{3}$/, "i").withMessage('Postal code should be a valid Spanish postal code format'),
    body('phone')
        .exists().withMessage('Phone number is required')
        .isLength({ min: 9 }).withMessage('Phone number should be at least 9 characters')
        .isNumeric().withMessage('Phone should contain only numbers')
        .matches(/^(6|7|8|9)\d{8}$/, "i").withMessage('Phone number should be a valid Spanish mobile or landline number')
]
