import { sequelize } from "../db/db.js";
import Todo from "../models/todo/todoModel.js";
import User from "../models/Users/userModel.js";
import { validationResult } from "express-validator";


export const getTodos = async (req, res) => {
    try {
        const todosResult = await Todo.findAll({ raw: true });

        const todosResultsPromises = todosResult.map(result =>
            User.findAll({ where: { id_user: result.user_id }, raw: true }));

        const allTodosResults = await Promise.all(todosResultsPromises);


        const tasksWithUser = todosResult.map((result, index) => {

            const users = allTodosResults[index].map(({ password, email, ...keepRest }) => keepRest);

            return {
                ...result,
                users
            };
        });


        // const tasksWithUser = todosResult.map((result, index) => ({
        //     ...result,
        //     users: allTodosResults[index]
        // }))

        // console.log(tasksWithUser);

        // console.log(allTodosResults);

        res.status(200).json({
            message: "Todo's list",
            data: tasksWithUser
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error fetching todo's list"
        });
    }
}

export const getTodoByUser = async (req, res) => {
    try {
        const user_id = req.params.id;

        const results = await Todo.findAll({ where: { user_id: user_id } })

        res.status(200).json({
            message: "User todo's",
            data: results
        })

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error fetching todo by user"
        })
    }
}

export const deleteTodo = async (req, res) => {
    try {
        const id_todo = req.params.id;

        const result = await Todo.destroy({ where: { id_todo } })


        res.status(200).json({
            message: "Task deleted",
            date: result

        })

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error deleting todo..."
        })
    }
}

export const updateTodo = async (req, res) => {
    console.log(req.body);
    try {
        const checkValidation = validationResult(req);

        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() })
        }

        const id_todo = req.params.id;
        const { title, assigned_date, due_date, status, priority, user_id, customer_id } = req.body;

        await Todo.update({ title, assigned_date, due_date, status, priority, user_id, customer_id }, { where: { id_todo } });

        res.status(200).json({
            message: "Todo updated",
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Failed to update todo"
        })
    }
}

export const addTodo = async (req, res) => {
    try {
        const checkValidation = validationResult(req);

        if (!checkValidation.isEmpty()) {
            return res.status(400).json({ errors: checkValidation.array() })
        }

        const { title, assigned_date, due_date, status, priority, user_id, customer_id } = req.body;

        const newTodo = await Todo.create({ title, assigned_date, due_date, status, priority, user_id, customer_id });
        newTodo.save();

        res.status(200).json({
            message: "Todo added",
            data: newTodo
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error adding todo"
        })
    }
}