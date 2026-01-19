/* Import standard values from PostgreSQL of the 'pg' node-module, 
values: user, database, password, port */

// const { user, database, password, port } = require('pg/lib/defaults')

// Import database configuration
const dbConfig = require('./configs/db')

/* Import the function Pool from the 'pg' node-module */
const Pool = require('pg').Pool

/* Pool reuses database connectios for better performance.
All connections use the same user credentials 'prescreen_db. */
const pool = new Pool(dbConfig.development)

/* Function to request the full data from prescreen_diag_data database,
get response using the same user credentials and connection. */
const queryFullDB = (request, response) => {
    pool.query('SELECT * FROM prescreen_diag_data', (error, results) => {
        /* Show an error if no connection to the db*/
        if (error) {
            throw error
        }
        /* Code 200 when connected to the db and get response from the db. */
        response.status(200).json(results.rows)
    })
 }

 /* Create an object of functions*/
 module.exports = {
    queryFullDB
 }
