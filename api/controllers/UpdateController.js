/**
 * CronController
 *
 * @description :: Server-side logic for managing cron
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

  scheduleWardsUpdate: function(req, res){
    Update.scheduleWards().then(function(data){
      res.type('application/json').send(data, 200);
    });
  },

  updateWards: function(req, res){
    Update.wards().then(function(data){
      res.type('application/json').send(data, 200);
    });
  }
  
};

            
