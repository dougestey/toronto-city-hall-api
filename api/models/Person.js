/**
* Person.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  connection: 'pupaDb',
  tableName: 'opencivicdata_person',
  autoCreatedAt: false,
  autoUpdatedAt: false,

  attributes: {

    createdAt: {
      type: 'datetime',
      defaultsTo: function (){ return new Date(); },
      columnName: 'created_at'
    },

    updatedAt: {
      type: 'datetime',
      defaultsTo: function (){ return new Date(); },
      columnName: 'updated_at'
    },

    id: {
      type: 'string',
      required: true
    },

    name: {
      type: 'string',
      required: true
    },

    image: {
      type: 'string'
    }

  }
};

