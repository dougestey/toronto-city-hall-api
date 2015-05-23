var CronService = {

  run: function(data){
    var d = Promise.defer();
    var initJob = function(){
      var CronJob = require('cron').CronJob;
      var job = new CronJob({
        //cronTime: '00 30 11 * * 1-5',
        cronTime: '* * * * * *',
        onTick: function() {
          /*
           * Runs every weekday (Monday through Friday)
           * at 11:30:00 AM. It does not run on Saturday
           * or Sunday.
           */
           console.log('Cron: ' + data);
        },
        start: false,
        timeZone: 'America/Toronto'
      });
      job.start();
      var response = {
        message: 'success'
      };
      d.resolve(response);
    };
    initJob();
    return d.promise;
  }

};

module.exports = CronService;