/**
* Motion.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  connection: 'pupaDb',
  tableName: 'opencivicdata_bill',
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

    identifier: {
      type: 'string',
      required: true
    },

    title: {
      type: 'string',
      required: true
    },

    from_organization_id: {
      type: 'string',
    },

    organization: {
      columnName: 'from_organization_id',
      model: 'committee',
    },

    term: {
      columnName: 'legislative_session_id',
      model: 'term'
    }

  }
};

