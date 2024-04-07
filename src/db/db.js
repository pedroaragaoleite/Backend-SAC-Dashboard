// import { createPool } from 'mysql2/promise';
import { Sequelize} from 'sequelize';
import { DB_DATABASE, DB_HOST, DB_USER, DB_PASSWORD, DB_PORT } from '../config.js';


const sequelize = new Sequelize(
    DB_DATABASE,
    DB_USER,
    DB_PASSWORD,
    {
        DB_HOST,
        dialect: 'mysql' 
    }
);

const syncroModel = async () => {
    try {
      // Sincronizar el modelo con la base de datos (crear la tabla si no existe)
      // Con "alter: true" se sincronizan las columnas y se crean/eliminan si fuera necesario
      await sequelize.sync({ force: false }).then(() => {
        console.log('Modelos sincronizado con la base de datos');
      }); 
    } catch (error) {
      console.error('Unable to connect to the database:', error);
    }
  };
    
  const testConnection = async () => {
    try {
      await sequelize.authenticate();
      console.log('Connection has been established successfully.');
      await syncroModel();
    } catch (error) {
      console.error('Unable to connect to the database:', error);
    }
  };



  // export const pool = createPool({
//     host: DB_HOST,
//     user: DB_USER,
//     password: DB_PASSWORD,
//     database: DB_DATABASE,
//     port: DB_PORT,
// })

  export { sequelize, testConnection };