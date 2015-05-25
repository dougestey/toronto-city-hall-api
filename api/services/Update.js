/**
 * Update
 *
 * @description :: A service for updating the server's database
 */
var http = require('http');

var Update = {

  /*
   * Update.wards
   *
   * Runs every weekday (Monday through Friday)
   * at 4:30:00 PM.
   */
  wards: function(){
    var d = Promise.defer();
    var httpOptions = {
      host: 'api.namara.io',
      port: 80,
      path: '/v0/data_sets/13364600-a54a-49bf-8a55-c84694a7d52d/data/en-0?limit=150&api_key=' + Keys.namara
    }; 
    var interval = '00 30 16 * * 1-5';
    var task = function(data){
      var data = JSON.parse(data);
      data.forEach(function(ward) {
        Ward.findOne()
        .where({ number: parseInt(ward.scode_name, 10) })
        .exec(function(err, datum){
          if (!datum) {
            console.log('[wards] No record for ' + ward.scode_name +', creating new...');
            Ward.create({
              number: parseInt(ward.scode_name, 10),
              region: ward.name,
              geo: ward.geometry
            })
            .exec(function(e, d){});
          } else {
            console.log('[wards] Record found for ' + ward.scode_name +', updating...');
            Ward.update({ number: parseInt(ward.scode_name, 10) }, {
              number: parseInt(ward.scode_name, 10),
              region: ward.name,
              geo: ward.geometry
            })
            .exec(function(e, d){});
          }
        });
      });
    };
    Update.schedule(httpOptions, interval, task).then(function(data){
      d.resolve(data);
    });
    return d.promise;
  },

  /*
   * Update.schedule
   *
   * Queues up a cron job.
   */
  schedule: function(httpOptions, interval, task){
    var d = Promise.defer();
    var initJob = function(){
      var CronJob = require('cron').CronJob;
      // define the job
      var job = new CronJob({
        cronTime: interval || '00 30 16 * * 1-5',
        onTick: function() {
          console.log('[scheduler] Starting run to ' + httpOptions.host);
          Update.run(httpOptions).then(function(data){
            console.log('[scheduler] Call succeeded. Running task...');
            if (task) {
              task(data);
            }
          });
        },
        start: false,
        timeZone: 'America/Toronto'
      });
      // start the job
      job.start();
      // finish init request
      var response = {
        host: httpOptions.host,
        path: httpOptions.path,
        port: httpOptions.port,
        interval: interval,
        status: 'started'
      };
      d.resolve(response);
    };
    initJob();
    return d.promise;
  },

  /*
   * Update.run
   *
   * Runs an HTTP call immediately.
   */
  run: function(options){
    var d = Promise.defer();
    http.get(options, function(response){
      console.log('[scheduler] Got response: ' + response.statusCode);
      if (response.statusCode == 429){
        console.log('[scheduler] Error: API limit reached.');
        d.reject();
      }
      var data = "";      
      response.on('data', function (chunk) {
        data += chunk;
      });
      response.on('end', function(){
        d.resolve(data);
      });
    });
    return d.promise;
  }

};

module.exports = Update;