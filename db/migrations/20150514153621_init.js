'use strict';

exports.up = function(knex, Promise) {

  return knex.schema

    .createTable('ward', function(table){
      table.increments('id').primary();
      table.dateTime('createdAt');
      table.dateTime('updatedAt');

      table.text('number');
      table.text('region');
      table.json('geo');
      table.integer('councillor').references('councillor.id').index();
    })
    .table('councillor', function(table) {
      table.integer('ward').references('ward.id').index();
    })
  
};

exports.down = function(knex, Promise) {
  
  return knex.schema
    .table('councillor', function(table){
      table.dropColumn('ward');
    })
    .dropTable('ward')

};
