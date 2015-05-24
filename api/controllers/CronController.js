/**
 * CronController
 *
 * @description :: Server-side logic for managing cron
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

  fetchWards: function(req, res){
    var options = {
      host: 'api.namara.io',
      port: 80,
      path: '/v0/data_sets/13364600-a54a-49bf-8a55-c84694a7d52d/data/en-0?api_key=ce383a73780252eadbc1b2fc557914d2b06116150a501eeeaff18ae01bf180a6&limit=150'
    }; 
    Scheduler.run(options).then(function(data){
      res.type('application/json').send(data, 200);
    });
  }
  
};

