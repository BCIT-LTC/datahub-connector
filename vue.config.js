const { key, cert } = require('openssl-self-signed-certificate');

module.exports = {
  devServer: {
    https: { key, cert },
    host: '0.0.0.0'
  },
};