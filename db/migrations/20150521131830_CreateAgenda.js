'use strict';

exports.up = function(knex, Promise) {

  return knex.schema
    .createTable('agenda', function(table) {
      table.increments('id').primary();
      table.dateTime('createdAt');
      table.dateTime('updatedAt');

      table.text('number');
      table.text('status');
    });
  
};

exports.down = function(knex, Promise) {

  return knex.schema
    .dropTable('agenda');
  
};
