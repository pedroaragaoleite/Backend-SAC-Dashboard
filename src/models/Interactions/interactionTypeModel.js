import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const Interaction = sequelize.define('Interaction', {
    id_interaction: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
    },
    name_interaction: {
        type: DataTypes.STRING(30),
        allowNull: false,
    }
})

export default Interaction;