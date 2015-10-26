var LoopbackServer, Promise, normalize;

normalize = require('path').normalize;

Promise = require('es6-promise').Promise;


/**
launches loopback server

@class LoopbackServer
 */

LoopbackServer = (function() {
  function LoopbackServer() {}

  LoopbackServer.prototype.entryPath = normalize(__dirname + '/../../loopback/server/server.js');

  LoopbackServer.prototype.launch = function() {
    return new Promise((function(_this) {
      return function(resolve) {
        return require(_this.entryPath).start(resolve);
      };
    })(this));
  };

  return LoopbackServer;

})();

module.exports = LoopbackServer;
