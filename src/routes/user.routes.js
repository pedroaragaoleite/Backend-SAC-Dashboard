import { Router } from "express";
import { deleteUser, getOutboundUsers, getRoles, getUser, getUsers, updateUser } from "../controllers/user.controller.js";
import authenticateToken from '../middlewares/authenticateToken.js';

import { updateValidator } from "../validations/auth.validations.js";

const router = Router();

router.get('/users', authenticateToken, getUsers);
router.get('/users/:id', authenticateToken, getUser);
router.get('/roles', authenticateToken, getRoles);
router.get('/outbound', authenticateToken, getOutboundUsers);
router.put('/users/:id', authenticateToken, updateValidator, updateUser);
router.delete('/delete/:id', authenticateToken, deleteUser);


export default router