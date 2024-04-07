// associations.js
import Campaign from './campaignModel.js';
import CampaignProduct from './campaignProductsModel.js';
import Brand from './brandModel.js';

CampaignProduct.belongsTo(Campaign, { foreignKey: 'id_campaign' });
Campaign.hasMany(CampaignProduct, { foreignKey: 'id_campaign' });

CampaignProduct.belongsTo(Brand, { foreignKey: 'id_brand' });
Brand.hasMany(CampaignProduct, { foreignKey: 'id_brand' });

export default associations;