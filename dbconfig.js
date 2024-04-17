const host = process.env.ORACLEDBHOST || 'orania2.inf.u-szeged.hu';
const cstr = '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST='+host+')(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SID=orania2)))';
const config = {
    user: process.env.ORACLEDBUSER || '',
    password: process.env.ORACLEDBPASSWORD || '',
    connectString: process.env.ORACLEDBCONNECTSTRING || cstr
};

module.exports = {config: config};
