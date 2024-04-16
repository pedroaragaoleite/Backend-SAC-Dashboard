import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const Customer = sequelize.define('Customer', {
    id_customer: {
        type: DataTypes.INTEGER(8),
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    address: {
        type: DataTypes.STRING(200),
        allowNull: false
    },
    city: {
        type: DataTypes.STRING(30),
        allowNull: false
    },
    postal_code: {
        type: DataTypes.STRING(6),
        allowNull: false
    },
    phone: {
        type: DataTypes.INTEGER(9),
        allowNull: false
    },

}, {
    indexes: [{ unique: true, fields: ['email', 'phone'] }],
    timestamps: true, // Activa la creación automática de createdAt y updatedAt
    updatedAt: 'updated_at',
    createdAt: 'created_at'
});

export default Customer;