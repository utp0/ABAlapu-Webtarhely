const oracledb = require('oracledb');
const db = oracledb.getConnection({
	user: '',
	password: '',
	connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=orania2.inf.u-szeged.hu)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SID=orania2)))'
});

module.exports = {db};
