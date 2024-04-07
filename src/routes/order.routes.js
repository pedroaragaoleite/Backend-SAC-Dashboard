import { Router } from 'express';
import { getInteractionByOption, getInteractions, getType } from '../controllers/order.controller.js';


const router = Router();

router.get('/orders/types', getType);
router.get('/orders/int', getInteractions);
router.get('/orders/:id', getInteractionByOption);

export default router;