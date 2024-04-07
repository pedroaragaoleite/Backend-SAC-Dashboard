import { Router } from "express";
import { loginUser, logOut, registerUser, isLogged } from "../controllers/auth.controller.js";
import { loginValidator, registerValidator } from '../validations/auth.validations.js';
import authenticateToken from "../middlewares/authenticateToken.js";

const router = Router();

router.post('/auth/login', loginValidator, loginUser)
router.post('/auth/register', authenticateToken, registerValidator, registerUser)
router.get('/auth/logout', logOut)
router.get('/auth/verify', authenticateToken, isLogged)

export default router;
