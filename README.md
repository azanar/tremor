Tremor
======

A hoopy API and historical archive on top of the USGS Earthquake reports

Setup
-----

    % cd <path-to-tremors>
    % createdb tremor
    % psql tremor < db/schema.sql
    % bundle install

Start the WebApp
----------------

    % ruby tremor.rb

This will start Sinatra, and the webapp will be hosted off port 4567.

An example cURL call to the server:

    % curl "http://localhost:4567/earthquakes.json?since=1391288429&over=2.0&near=25.87,124.74"


Updating the Records
--------------------

    % cd <path-to-tremors>
    % rake poll

Running the Tests
-----------------

    % cd <path-to-tremors>
    % rake test

Known Issues
------------

The API isn't nearly as tested as the Ingestor. This will be fixed as soon as
I have more time to do so.

