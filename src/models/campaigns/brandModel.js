import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";



const Brand = sequelize.define('Brand', {
    id_brand: {
        type: DataTypes.INTEGER(10),
        autoIncrement: true,
        primaryKey: true
    },
    brand: {
        type: DataTypes.STRING(20),
        allowNull: false
    }
}, {
    timestamps: true, // Activa la creación automática de createdAt y updatedAt
    updatedAt: 'updated_at',
    createdAt: 'created_at'
})



export default Brand;