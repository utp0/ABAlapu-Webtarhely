const oracledb = require('oracledb');
oracledb.autoCommit = true;

const host = process.env.ORACLEDBHOST || 'orania2.inf.u-szeged.hu';
const cstr = '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST='+host+')(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SID=orania2)))';
const config = {
    user: process.env.ORACLEDBUSER || '',
    password: process.env.ORACLEDBPASSWORD || '',
    connectString: process.env.ORACLEDBCONNECTSTRING || cstr
};

async function execute(sql, bindings) {
    console.log(sql);
    console.log(bindings);

    const dbconn = await oracledb.getConnection(config);
    const result = await dbconn.execute(sql, bindings, {outFormat: oracledb.OUT_FORMAT_OBJECT});
    await dbconn.close();

    console.log(result.rows && result.rows.length);
    console.log();

    return result.rows;
}

module.exports = execute;
