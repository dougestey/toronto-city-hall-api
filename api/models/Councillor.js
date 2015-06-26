/**
* Councillor.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {

    email: {
      type: 'email',
      required: true
    },

    first_name: {
      type: 'string',
      required: true
    },

    last_name: {
      type: 'string',
      required: true
    },

    ward: {
      model: 'ward',
    },

    phone: {
      type: 'string',
      required: true
    },

    image_url: {
      type: 'string'
    },

    website_url: {
      type: 'string'
    },

    twitter_handle: {
      type: 'string'
    },

    facebook_handle: {
      type: 'string'
    },

    bio: {
      type: 'text'
    },

    terms: {
      type: 'json'
    }

  }
};