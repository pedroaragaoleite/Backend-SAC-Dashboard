import { validationResult } from "express-validator";
import { sequelize } from "../db/db.js";
import { QueryTypes } from 'sequelize';
import Customer from "../models/customers/customerModel.js";
import Todo from "../models/todo/todoModel.js";


export const getCustomers = async (req, res) => {
    try {
        const customers = await Customer.findAll();
        if (customers.length === 0) {
            return res.status(404).json({ message: 'No customers found' })
        }

        res.status(200).json({
            message: 'Customers list',
            data: customers
        })
    } catch (error) {
        console.error('Error fetching customers', error);
    }
}

export const addCustomer = async (req, res) => {
    try {

        const checkValidation = validationResult(req)

        console.log(checkValidation);

        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() })
        }


        const { name, email, address, city, postal_code, phone } = req.body;

        const existEmail = await Customer.findOne({ where: { email } });
        const existPhone = await Customer.findOne({ where: { phone: phone } })
        if (existEmail || existPhone) {
            return res.status(400).json({
                message: "Customer already registered..."
            });
        }

        const newCustomer = await Customer.create({ name, email, address, city, postal_code, phone });
        await newCustomer.save();

        res.status(200).json({
            message: "Customer registered with success",
            data: newCustomer
        })

    } catch (error) {
        console.error('Error creating customer', error)
    }
}

export const updateCustomer = async (req, res) => {
    try {
        const checkValidation = validationResult(req);

        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() })
        }
        // console.log(checkValidation);

        const id_customer = req.params.id;
        console.log(id_customer);
        const { name, email, address, city, postal_code, phone } = req.body;


        await Customer.update({ name, email, address, city, postal_code, phone }, { where: { id_customer } });

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

export const deleteCustomer = async (req, res) => {
    try {
        const id_customer = req.params.id;

        const task = await Todo.findOne({ where: { customer_id: id_customer } })
        if (task) {
            return res.status(500).json({
                message: "Error deleting the customer, there is a task assigned to the customer"
            })
        };

        await Customer.destroy({ where: { id_customer: id_customer } })

        res.status(200).json({
            message: "Customer deleted"
        })
    } catch (error) {
        console.error("Error deleting customer", error)
    }
}
