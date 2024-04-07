import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";

const InteractionOption = sequelize.define('InteractionOption', {
    id_option: {
        type: DataTypes.INTEGER(8).UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
    },
    id_interaction: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
          model: 'interactions', 
          key: 'id_interaction', 
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
      },
      name_option: {
        type: DataTypes.STRING(50),
        allowNull: false
      },
      createdAt: {
        type: DataTypes.DATE,
        allowNull: false
      },
      updatedAt: {
        type: DataTypes.DATE,
        allowNull: false
      }
}, {
    tableName: 'interaction_options',
    timestamps: true,
    charset: 'utf8mb4',
    collate: 'utf8mb4_general_ci'
});

export default InteractionOption;