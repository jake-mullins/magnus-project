const { Pool }  = require("pg")
require("dotenv").config();

const pool = new Pool({
    host:   process.env.PGHOST,
    port:   process.env.PGPORT, 
    database: process.env.PGDATABASE, 
    user: process.env.PGUSER,
    password: process.env.PGPASSWORD
});

(async () => {
    await pool.query(`SELECT 1`);
    console.log("Connected to Postgres");
})().catch((err) => {
    console.log(err);
})

module.exports  = pool;
