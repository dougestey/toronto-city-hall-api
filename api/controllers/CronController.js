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
      path: '/v0/data_sets/13364600-a54a-49bf-8a55-c84694a7d52d/data/en-0?limit=150&api_key=' + Keys.namara
    }; 
    Scheduler.run(options).then(function(data){
      console.log(data.length);
      for (var i = 0; i < data.length; i++) {
        /*Ward.create({
          number: data[i].scode_name,
          region: data[i].name,
          geo: data[i].geometry
        })
        .exec(function(err, user) { console.log(err); console.log(user); });*/
      }
      res.type('application/json').send(data, 200);
    });
  }
  
};

            
