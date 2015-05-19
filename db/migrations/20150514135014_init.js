'use strict';

exports.up = function(knex, Promise) {

  return knex.schema
    .createTable('user', function(table) {
      table.increments('id').primary();
      table.dateTime('createdAt');
      table.dateTime('updatedAt');

      table.text('email').unique().index();
      table.text('password');
      table.text('avatarUrl');
      table.text('firstName');
      table.text('lastName');
    })

    .createTable('councillor', function(table) {
      table.increments('id').primary();
      table.dateTime('createdAt');
      table.dateTime('updatedAt');

      table.text('email').unique().index();
      table.text('avatarUrl');
      table.text('firstName');
      table.text('lastName');
      table.text('bio');
      table.text('phone');
    });
  
};

exports.down = function(knex, Promise) {

  return knex.schema
    .dropTable('user')
    .dropTable('councillor');
  
};
