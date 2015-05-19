# Toronto City Hall API

Powering the future of open source municipal projects in and around Toronto.

## Setup ##

Clone & build.

    $ cd toronto-city-hall-api
    $ npm install

Next, install Sails CLI. Alternatively, run these commands from your local project node_modules.

    $ npm install -g sails && npm install -g sails-migrations

You have two options for data persistence: sails-disk (dev only) or sails-postgresql (prod/real life). Configure the connection you wish to use in [config/connections.js](https://github.com/designcofounders/toronto-city-hall-api/blob/master/config/connections.js). Then provision your DB:

    $ sails-migrations migrate

And finally lift the sails:

    $ sails lift
