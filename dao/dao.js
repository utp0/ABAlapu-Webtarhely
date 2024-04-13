const oracledb = require('oracledb');
const {config} = require("../dbconfig");

async function execute(sql, bindings) {
    let db = null, retval = new Error("Nem történt semmi.");
    try {
        db = await oracledb.getConnection(config);
        let result = await db.execute(sql, bindings, {
            outFormat: oracledb.OUT_FORMAT_OBJECT
        });
        await db.commit()

        db.close()
        retval = result
    } catch (e) {
        console.error(e)
        retval = e
    } finally {
        try {
            if (db != null) await db.close();
        } catch (e) {
            console.log("db már zárva volt");
        }
        if (retval instanceof Error) throw retval;
        return retval;
    }
}

module.exports = {
    execute
}
