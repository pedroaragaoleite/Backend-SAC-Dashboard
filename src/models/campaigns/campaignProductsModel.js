import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";
import Campaign from "./campaignModel.js";
import Brand from "./brandModel.js";



const CampaignProduct = sequelize.define('CampaignProduct', {
    id_campaign_product: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    campaign_id: {
        type: DataTypes.INTEGER,
        references: {
            model: Campaign,
            key: 'id_campaign'
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    },
    brand_id: {
        type: DataTypes.INTEGER,
        references: {
            model: Brand,
            key: 'id_brand'
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    },
    sunglass_units: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    eyewear_units: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    }
});

Campaign.belongsToMany(Brand, { through: CampaignProduct, foreignKey: 'campaign_id' });
Brand.belongsToMany(Campaign, { through: CampaignProduct, foreignKey: 'brand_id' });

export default CampaignProduct;