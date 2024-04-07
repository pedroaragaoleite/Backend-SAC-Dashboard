import { Router } from "express";
import { addCampaign, deleteCampaign, getBrand, getBrands, getCampaign, getCampaignByUser, getCampaignProducts, getCampaignProductsById, getCampaigns, updateCampaign } from "../controllers/campaign.controller.js";
import authenticateToken from '../middlewares/authenticateToken.js';


const router = Router();

router.get('/brands', authenticateToken, getBrands);
router.get('/brands/:id', authenticateToken, getBrand);
router.get('/campaigns', authenticateToken, getCampaigns);
router.get('/campaigns/:id', authenticateToken, getCampaign);
router.get('/campaigns/user/:id', authenticateToken, getCampaignByUser);
router.get('/campaign_products', authenticateToken, getCampaignProducts);
router.get('/campaign_products/:id', authenticateToken, getCampaignProductsById);
router.post('/campaigns/register', authenticateToken, addCampaign);
router.delete('/campaigns/delete/:id', authenticateToken, deleteCampaign);
router.put('/campaigns/update/:id', authenticateToken, updateCampaign);

export default router;

