import { body } from 'express-validator';

export const todoValidator = [
    body('title')
        .exists().withMessage('Title is required')
        .isString().withMessage('Title should be a string')
        .isLength({ min: 10 }).withMessage('Title should be at least 10 characters'),
    body('assigned_date')
        .exists().withMessage('Assigned date is required')
        .isString().withMessage('Assigned should be a string'),
    body('due_date')
        .exists().withMessage('Due date is required')
        .isString().withMessage('Due date should be a string'),
    body('status')
        .exists().withMessage('Status is required')
        .isString().withMessage('Status should be a string')
        .notEmpty().withMessage('Status cannot be empty')
        .isIn(['new', 'pending', 'in progress', 'completed']).withMessage('Invalid status value'),
    body('priority')
        .exists().withMessage('Priority is required')
        .notEmpty().withMessage('Status cannot be empty')
        .isString().withMessage('Priority should be a string')
        .isIn(['low', 'medium', 'high']).withMessage('Invalid priority value'),
    body('user_id')
        .exists().withMessage('User  is required')
        .isNumeric().withMessage('User should be a number'),
    body('customer_id')
        .exists().withMessage('Customer is required')
        .isNumeric().withMessage('Customer should be numeric')
]