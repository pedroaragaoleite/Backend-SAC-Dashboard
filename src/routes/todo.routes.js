import { Router } from 'express';
import { addTodo, deleteTodo, getTodoByUser, getTodos, updateTodo } from '../controllers/todo.controller.js';
import authenticateToken from '../middlewares/authenticateToken.js';

import { todoValidator } from '../validations/todo.validations.js';


const router = Router();

router.get('/todos', authenticateToken, getTodos);
router.get('/todos/:id', authenticateToken, getTodoByUser);
router.delete('/todos/delete/:id', authenticateToken, deleteTodo);
router.put('/todos/update/:id', authenticateToken, todoValidator, updateTodo);
router.post('/todos/register', authenticateToken, todoValidator, addTodo);

export default router;