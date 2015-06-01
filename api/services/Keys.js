var fs = require('fs');

var keysStore = {};

try {
  keysStore.namara = fs.readFileSync('keys/namara');
} catch (e) {
  if (e.code === 'ENOENT') {
    keysStore.namara = null;
  } else {
    throw e;
  }
}

var Keys = {
  namara: keysStore.namara,
}

module.exports = Keys;