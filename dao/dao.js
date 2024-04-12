const oracledb = require('oracledb');
const {config} = require("../dbconfig");

async function execute(sql, bindings) {
    let db, result = null;
    try {
        db = await oracledb.getConnection(config);
        result = await db.execute(sql, bindings);

        db.close()
        return result
    } catch (e) {
        // TODO
    } finally {
        if (typeof db.isConnected === 'function' && db.isConnected()) {
            db.close();
        }
    }
}

module.exports = {
    execute
}
