import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";
import User from "../Users/userModel.js";


const Campaign = sequelize.define('Campaign', {
    id_campaign: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    title: {
        type: DataTypes.STRING(150),
        allowNull: false,
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    start_date: {
        type: DataTypes.DATE,
    },
    end_date: {
        type: DataTypes.DATE
    },
    status: {
        type: DataTypes.ENUM('active', 'inactive', 'finished'),
        allowNull: false,
        defaultValue: 'active'
    },
    user_id: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        allowNull: false,
        references: {
            model: User,
            key: 'id_user',
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    }
}, {
    timestamps: true, // Activa la creación automática de createdAt y updatedAt
    updatedAt: 'updated_at',
    createdAt: 'created_at'
});



export default Campaign;