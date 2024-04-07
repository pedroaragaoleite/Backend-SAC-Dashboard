import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const Order = sequelize.define('Order', {
    id_order: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
    }
})