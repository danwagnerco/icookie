iCookie
=======

Weather to email app, hunks need not apply.

#### How to populate locations
Since there are about 40,000 zip codes with latitude/longitude pairs, the whole thing has been put in a rake task. Run it from your terminal:

`cd icookie` then `rake import_locations_csv:create_locations`

Yahtzee!
