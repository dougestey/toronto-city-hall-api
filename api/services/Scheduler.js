var http = require('http');

var Scheduler = {

  start: function(options){
    var d = Promise.defer();
    var initJob = function(){
      var CronJob = require('cron').CronJob;
      // define the job
      var job = new CronJob({
        //cronTime: '00 30 16 * * 1-5',
        cronTime: '15 * * * * *',
        onTick: function() {
          /*
           * Runs every weekday (Monday through Friday)
           * at 4:30:00 PM. It does not run on Saturday
           * or Sunday.
           */
          console.log('Cron: ' + JSON.stringify(options));
          http.get(options, function(resp){
            resp.on('data', function(chunk){
              //do something with chunk
              console.log("Got chunk");
            });
          }).on("error", function(e){
            console.log("Got error: " + e.message);
          });
        },
        start: false,
        timeZone: 'America/Toronto'
      });
      // start the job
      job.start();
      // finish init request
      var response = {
        message: 'job started'
      };
      d.resolve(response);
    };
    initJob();
    return d.promise;
  },

  run: function(options){
    var d = Promise.defer();
    http.get(options, function(response){
        
        console.log('Got response: ' + response.statusCode);
        
        if (response.statusCode == 429){
          console.log('Error: API limit reached.');
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

module.exports = Scheduler;