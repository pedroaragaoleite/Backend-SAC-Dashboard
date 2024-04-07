import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const Role = sequelize.define('Role', {
    id_role: {
        type: DataTypes.INTEGER(8),
        primaryKey: true,
        autoIncrement: true,
    },
    role_name: {
        type: DataTypes.STRING(20),
        allowNull: false,
    }
}, {
    indexes: [{ unique: true, fields: ['role_name'] }],
    timestamps: true, // Activa la creación automática de createdAt y updatedAt
    updatedAt: 'updated_at',
    createdAt: 'created_at'
})

export default Role;