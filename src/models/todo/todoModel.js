import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";
import User from "../Users/userModel.js";
import Customer from "../customers/customerModel.js";

const Todo = sequelize.define('Todo', {
    id_todo: {
        type: DataTypes.INTEGER(8),
        primaryKey: true,
        autoIncrement: true
    },
    title: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    assigned_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    due_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    status: {
        type: DataTypes.ENUM('new', 'pending', 'in progress', 'completed'),
        allowNull: false,
        defaultValue: 'new'
    },
    priority: {
        type: DataTypes.ENUM('low', 'medium', 'high'),
        allowNull: false,
        defaultValue: 'low'
    },
    user_id: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        allowNull: false,
        references: {
            model: User,
            key: 'id_user',
        }
    },
    customer_id: {
        type: DataTypes.INTEGER(8),
        references: {
            model: Customer,
            key: 'id_customer'
        }
    },
}, {
    timestamps: true, // Activa la creación automática de createdAt y updatedAt
    updatedAt: 'updated_at',
    createdAt: 'created_at'
});

export default Todo;