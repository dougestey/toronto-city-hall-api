/**
* VoteEvent.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  connection: 'pupaDb',
  tableName: 'opencivicdata_voteevent',
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

    motion_text: {
      type: 'string',
      required: true
    },

    result: {
      type: 'string',
      required: true
    },

    motion: {
      columnName: 'bill_id',
      model: 'motion'
    },

    term: {
      columnName: 'legislative_session_id',
      model: 'term'
    }

  }
};

