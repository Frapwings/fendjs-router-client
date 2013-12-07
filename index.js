/**
 * Import(s)
 */

var Router = require('fendjs-router');
var debug = require('debug')('fendjs-router-client:index');

/**
 * Export(s)
 */

exports = module.exports = ClientRouter;

/**
 * Initialize a new ClientRouter.
 *  
 * @api public
 */

function ClientRouter(options) {
  Router.call(this, options);
}

/**
 * Inherit from `Router.prototype`.
 */

ClientRouter.prototype.__proto__ = Router.prototype;
