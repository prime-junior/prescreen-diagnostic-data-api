// Load the env vars
require("dotenv").config();
const config = {
    development: {
        user: process.env.DB_USER,
        host: process.env.DB_HOST,
        database: process.env.DB_DATABASE,
        password: String(process.env.DB_PASSWORD),
        port: process.env.DB_PORT,
        dialect: 'postgresql', // because the project uses PostgreSQL
        logging: false,
    }
};

module.exports = config;