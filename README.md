# Toronto City Hall API

Powering the future of open source municipal projects in and around Toronto.

## Accessing the API ##

The API has not been publicly staged yet, but that's going to change in the near future.

## Hacking on the API ##

Clone & build.

    $ cd toronto-city-hall-api
    $ npm install

Next, install Sails CLI (you can alternatively run these commands from your local project node_modules):

    $ npm install -g sails

You have two options for data persistence: sails-disk (dev only) or sails-postgresql (prod/real life). 

If you're using the former, skip straight to the lifting the sails.

If you're using SQL, configure the connection you wish to use in [config/connections.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/connections.js) and update [config/env/development.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/env/development.js) to reference the postgres db. 

If you'd like a fresh, empty db to hack on then skip this step and go straight to migrations - but if you'd like to bootstrap with the latest available snapshot, run the following:

    $ psql your_db_name < db/init/2015-05-22.sql 

A user by the name of toronto_api_user will need access to your db (you can change this by replacing it with your desired username in the import file.)

Then install sails-migrations CLI and provision the database. It's important to do this even if you imported an SQL snapshot, as its schema may have changed since it was taken.
```
$ npm install -g sails-migrations
$ sails-migrations migrate
```

Finally, lift the sails:

    $ sails lift

## Updating data against third party data ##

The API is capable of updating its local database against external information on wards, councillors, agendas, etc. These updates are scheduled through the [Update service](https://github.com/designcofounders/toronto-city-hall-api/blob/master/api/services/Update.js). Their schedules start running on server startup in [config/bootstrap.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/bootstrap.js), but you can also invoke them manually by curling the routes available in [config/routes.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/routes.js).

You're going to want to specify the API keys you're using to access said third parties. Place them in [keys/](https://github.com/designcofounders/toronto-city-hall-api/tree/master/keys) and update [api/services/Keys.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/api/services/Keys.js) accordingly before attempting to run things in the Update service.

For example, if you wanted to get the latest ward data & geometry from a service like Namara.io, you would run:

$ curl http://localhost:1337/update/wards

Your server console will tell you how it goes. :)

