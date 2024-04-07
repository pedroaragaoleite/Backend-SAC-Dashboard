import { Router } from "express";
import { addCustomer, deleteCustomer, getCustomers, updateCustomer } from "../controllers/customer.controller.js";
import authenticateToken from '../middlewares/authenticateToken.js';
import { customerValidator } from "../validations/customer.validations.js";

const router = Router();

router.get('/customers', authenticateToken, getCustomers);
router.put('/customers/:id', authenticateToken, customerValidator, updateCustomer);
router.post('/customers/register', authenticateToken, customerValidator, addCustomer);
router.delete('/customers/delete/:id', authenticateToken, deleteCustomer);

export default router;