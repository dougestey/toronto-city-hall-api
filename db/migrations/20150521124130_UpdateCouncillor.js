'use strict';

exports.up = function(knex, Promise) {

  return knex.schema
    .table('councillor', function(table) {
      table.renameColumn('firstName', 'first_name');
      table.renameColumn('lastName', 'last_name');
      table.renameColumn('avatarUrl', 'image_url');
      table.text('website_url');
      table.text('twitter_handle');
      table.text('facebook_handle');
      table.json('terms');
    })
  
};

exports.down = function(knex, Promise) {

  return knex.schema
    .table('councillor', function(table) {
      table.renameColumn('first_name', 'firstName');
      table.renameColumn('last_name', 'lastName');
      table.renameColumn('image_url', 'avatarUrl');
      table.dropColumn('website_url');
      table.dropColumn('twitter_handle');
      table.dropColumn('facebook_handle');
      table.dropColumn('terms');
    })
  
};
