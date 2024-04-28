const oracledb = require('oracledb');
oracledb.autoCommit = true;

const host = process.env.DBHOST || 'orania2.inf.u-szeged.hu';
const cstr = '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST='+host+')(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SID=orania2)))';
const config = {
    user: process.env.DBUSER || '',
    password: process.env.DBPWD || '',
    connectString: process.env.DBCSTR || cstr
};

const fakemode = process.env.FAKEDB;

async function execute(sql, bindings) {
    console.log(sql);
    console.log(bindings);

    const dbconn = await oracledb.getConnection(config);
    const result = await dbconn.execute(sql, bindings, {outFormat: oracledb.OUT_FORMAT_OBJECT});
    await dbconn.close();

    //console.log(result.rows && result.rows.length);
    if(result.rows) {
	for(const [i, row] of result.rows.entries()) {
	    console.log(i, row);
	}
    }
    console.log();

    return result.rows;
}
async function fakeexec(sql, bindings) {
    console.log(sql);
    console.log(bindings);
    return [];
}

module.exports = fakemode ? fakeexec : execute;
