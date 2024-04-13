const oracledb = require('oracledb');
const {config} = require("../dbconfig");

async function execute(sql, bindings) {
    let db, result = null;
    try {
        db = await oracledb.getConnection(config);
        result = await db.execute(sql, bindings);
        await db.commit()

        db.close()
        return result
    } catch (e) {
        console.error(e)
    } finally {
        try {
            await db.close();
        } catch (e) {
            console.log("db már zárva volt");
        }
    }
}

module.exports = {
    execute
}
