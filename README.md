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

* If you're using the former, skip straight to the lifting the sails.
* If you're using an SQL db, configure the connection you wish to use in [config/connections.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/connections.js). Then install sails-migrations CLI and provision your DB:
    $ npm install -g sails-migrations
    $ sails-migrations migrate

Finally, lift the sails:

    $ sails lift
