/**
* Term.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  connection: 'pupaDb',
  tableName: 'opencivicdata_legislativesession',
  autoCreatedAt: false,
  autoUpdatedAt: false,

  attributes: {

    identifier: {
      type: 'string',
      required: true
    },

    name: {
      type: 'string',
      required: true
    }

  }
};

