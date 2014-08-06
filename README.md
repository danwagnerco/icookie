iCookie
=======

Weather to email app, hunks need not apply.

#### How to populate locations
Since there are about 40,000 zip codes with latitude/longitude pairs, the whole thing has been put in a rake task. Run it from your terminal:

`cd icookie` then `rake import_locations_csv:create_locations`

Yahtzee!

#### Secret stuff inside ~/config/application.yaml
Make a copy of application.example.yaml and populate it with the secret stuff.

#### TODO
* build a wrapper model for forecast_io (call it ForecastInterface ?)
* update location model to use ForecastInterface
