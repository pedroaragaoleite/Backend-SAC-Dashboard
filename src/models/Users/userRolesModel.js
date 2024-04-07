import { DataTypes } from "sequelize";
import { sequelize } from "../../db/db.js";
import User from './userModel.js';
import Role from './rolesModel.js';


const UserRoles = sequelize.define('UserRoles', {
    id_user: {
        type: DataTypes.INTEGER(8),
        allowNull: false,
        references: {
            model: User,
            key: 'id_user',
        },
        primaryKey: true,
    },
    role_id: {
        type: DataTypes.INTEGER(8),
        allowNull: false,
        references: {
            model: Role,
            key: 'id_role'
        },
        primaryKey: true,
    }

}, {
    tableName: 'user_roles',
    charset: 'utf8mb4',
    collate: 'utf8mb4_general_ci',
})

User.belongsToMany(Role, { through: UserRoles, foreignKey: 'id_user' });
Role.belongsToMany(User, { through: UserRoles, foreignKey: 'role_id' });

export default UserRoles;