Ward.create({
  number: '43',
  region: 'Scarborough East'
  geo: null,
  councillor: 2
  })
  .exec(function(err, user) { console.log(err); console.log(user); });