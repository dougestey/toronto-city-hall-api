var fs = require('fs');

var Keys = {
  namara: fs.readFileSync('keys/namara'),
}

module.exports = Keys;