import { sequelize } from "../db/db.js";
import Brand from "../models/campaigns/brandModel.js";
import Campaign from "../models/campaigns/campaignModel.js";
import CampaignProduct from "../models/campaigns/campaignProductsModel.js";

export const getBrands = async (req, res) => {
    try {
        const brands = await Brand.findAll();

        res.status(200).json({
            message: "Brands list",
            data: brands
        })

    } catch (error) {
        console.error("Error fetching brands", error)
    }
}

export const getBrand = async (req, res) => {
    try {
        const id_brand = req.params.id;

        const result = await Brand.findOne({ where: { id_brand } })

        if (result === 0) {
            res.status(404).json({ message: "No brand found" })
        }

        res.status(200).json({
            message: "Brand found",
            data: result
        })

    } catch (error) {
        console.error("Error fetching brand: ", error)
    }
}


export const getCampaigns = async (req, res) => {
    try {
        const campaigns = await Campaign.findAll({ raw: true });

        const campaignProductsPromises = campaigns.map(campaign =>
            CampaignProduct.findAll({ where: { campaign_id: campaign.id_campaign }, raw: true })
        );

        const allCampaignProducts = await Promise.all(campaignProductsPromises);

        // Prepare to fetch brand details for each product
        const campaignsProductsBrandsPromises = allCampaignProducts.map(products =>
            Promise.all(products.map(async product => {
                const brands = await Brand.findByPk(product.brand_id, { raw: true });

                return brands
            }))
        );

        const allCampaignProductsWithBrands = await Promise.all(campaignsProductsBrandsPromises);

        const campaignsWithProductsAndBrands = campaigns.map((campaign, index) => ({
            ...campaign,
            products: allCampaignProducts[index],
            brands: allCampaignProductsWithBrands[index]
        }));

        res.status(200).json({
            message: "Campaigns with products and brands fetched successfully",
            data: campaignsWithProductsAndBrands
            // data: allCampaignProductsWithBrands
        });



    } catch (error) {
        console.error("Error fetching campaigns", error)
    }
}

export const getCampaign = async (req, res) => {
    try {
        const id_campaign = req.params.id;

        const result = await Campaign.findOne({ where: { id_campaign } })

        if (result === 0) {
            res.status(404).json({ message: "No campaign found" })
        }

        res.status(200).json({
            message: "Campaign found",
            data: result
        })

    } catch (error) {
        console.error("Error fetching campaign: ", error)
    }
}

export const getCampaignByUser = async (req, res) => {
    try {
        const user_id = req.params.id;

        const campaigns = await Campaign.findAll({ where: { user_id }, raw: true })



        const campaignProductsPromises = campaigns.map(campaign =>
            CampaignProduct.findAll({ where: { campaign_id: campaign.id_campaign }, raw: true })
        );

        const allCampaignProducts = await Promise.all(campaignProductsPromises);


        // Prepare to fetch brand details for each product
        const campaignsProductsBrandsPromises = allCampaignProducts.map(products =>
            Promise.all(products.map(async product => {
                const brands = await Brand.findByPk(product.brand_id, { raw: true });

                return brands;
            }))
        );

        const allCampaignProductsWithBrands = await Promise.all(campaignsProductsBrandsPromises);


        const campaignsWithProductsAndBrands = campaigns.map((campaign, index) => ({
            ...campaign,
            products: allCampaignProducts[index],
            brands: allCampaignProductsWithBrands[index]
        }));


        res.status(200).json({
            message: "Campaigns with products and brands fetched successfully",
            data: campaignsWithProductsAndBrands
            // data: allCampaignProductsWithBrands
        });


    } catch (error) {
        console.error("Error fetching campaign: ", error)
    }
}

export const getCampaignProducts = async (req, res) => {
    try {
        const campaignsProducts = await CampaignProduct.findAll();

        res.status(200).json({
            message: "Campaign products list",
            data: campaignsProducts
        })

    } catch (error) {
        console.error("Error fetching campaign products", error)
    }
}

export const getCampaignProductsById = async (req, res) => {
    try {
        const campaign_id = req.params.id;
        const result = await CampaignProduct.findAll({ where: { campaign_id } });

        if (result === 0) {
            res.status(404).json({ message: "No campaign found" })
        }

        res.status(200).json({
            message: "Campaign by id found",
            data: result
        })

    } catch (error) {
        console.error("Error fetching results", error)
    }
}

export const deleteCampaign = async (req, res) => {
    try {
        const id_campaign = req.params.id;
        await Campaign.destroy({ where: { id_campaign: id_campaign } });

        res.status(200).json({ message: "Campaign deleted" });


    } catch (error) {
        console.error("Error deleting campaign", error)
    }
}

export const addCampaign = async (req, res) => {
    try {

        const { title, description, start_date, end_date, status, user_id } = req.body;
        const [result] = req.body.products;

        const brand_id = result.brand_id;
        const productA_units = result.productA_units;
        const productB_units = result.productB_units;

        const newCampaign = await Campaign.create({ title, description, start_date, end_date, status, user_id });
        newCampaign.save()


        const campaignId = await Campaign.findOne({ where: { id_campaign: newCampaign.id_campaign } })

        const brandId = await Brand.findOne({ where: { id_brand: brand_id } })

        const campaignProductTeste = await CampaignProduct.create({ campaign_id: campaignId.id_campaign, brand_id: brandId.id_brand, productA_units, productB_units })
        campaignProductTeste.save();


        res.status(200).json({
            message: 'Campaign registered with success',
            data: newCampaign,
            res: campaignProductTeste
        })

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error creating campaing",
            error: error
        })
    }
}

export const updateCampaign = async (req, res) => {
    try {
        const id_campaign = req.params.id;
        const { title, description, start_date, end_date, status, user_id } = req.body;
        const [result] = req.body.products;
        const { productA_units, productB_units, brand_id } = result;


        await Campaign.update({ title, description, start_date, end_date, status, user_id }, { where: { id_campaign } });
        await CampaignProduct.update({ productA_units, productB_units, brand_id }, { where: { campaign_id: id_campaign } });


        res.status(200).json({
            message: "Campaign updated"
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error updating project"
        })
    }
}