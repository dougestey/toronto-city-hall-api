/**
* Ward.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {

    number: {
      type: 'integer',
      required: true
    },

    region: {
      type: 'string',
      required: true
    },

    geo: {
      type: 'json'
    },

    councillor: {
      model: 'councillor'
    }

  }
};

