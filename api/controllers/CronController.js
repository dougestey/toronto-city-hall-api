/**
 * CronController
 *
 * @description :: Server-side logic for managing cron
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

  run: function(req, res){
    CronService.run().then(function(data){
      res.json(data, 200);
    });
  }
  
};

