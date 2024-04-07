import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const Type = sequelize.define('Type', {
    id_type: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
    },
    name_type: {
        type: DataTypes.STRING(10),
        allowNull: false,
    }
});

export default Type;