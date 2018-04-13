# Clash Dash

Displays clan data in a graphical, easy to read form.

See http://nightwarriors.crazy.technology for a sample set up.

## Update to V2.0 (9 Feb 2018)
 - Upgraded from Bootstrap v4.0.0 beta to Bootstrap v 4.0.0
 - Layout enhancements with grid (CSS) - Breaks compatibility with Internet Explorer
 - Added minimal AngularJS (from CDN) to more easily update clan info DOM
 - Refactored code to utilize AngularJS instead of JQuery for updating elements on page
 - Charts now trim long player names
 - Current Donations chart now show Donations & Donations Received
 - Added ability to click charts to navigate to user profile

### Bug Fixes in V2.0
 - Properly excluded inactive players from Current Donations chart
 - Fixed font "text-rendering: geometricPrecision;" to properly display the digit '2'

## Project Setup

### scripts/cron.sh 
Runs [coc.php](https://github.com/EdwinChua/clash/blob/master/phpScripts/coc.php) to get a specific clan's info.

1. Change `cd /var/www/nightwarriors/phpScripts` to the appropriate folder (the path should look like `/var/www/<your folder here>/phpScripts`
2. Set up a cron job to schedule the api calls periodically

### phpScripts/coc.php
Get's clan info via clan tag specified by `$clantag` variable. Replace `$token` with your valid token. 

This script saves a file saved-data/clan-info.json, containing 3 items:
 - Date and time script was run
 - Clan info
 - Full profile for each player in the clan


Note: This will result in ~50 API calls each time this script is run, which is why I do not call it directly on page load. 
 (1) It's slow. 
 (2) Your API calls may be blocked if called too frequently.

#### includes phpScripts/currentdate.php
This file provides a way to save the time the API calls were made. (For verification that your cron job is running as scheduled)

The default timezone in phpScripts/currentdate.php is Singapore. If you'd like to change it, here are the supported timezones in php:
https://secure.php.net/manual/en/timezones.php

### phpScripts/return-saved-data.php
Responds with the saved-data/clan-info.json. Modify to suit your needs

## Additional Info

This site uses [Chart.js](http://www.chartjs.org) charts, bootstrap, and PHP.

Feel free to open a new issue with ideas and suggestions.

Clash on!

Disclaimer: "This content is not affiliated with, endorsed, sponsored, or specifically approved by Supercell and Supercell is not responsible for it. For more information see Supercell's Fan Content Policy: www.supercell.com/fan-content-policy."

Like my work? Buy me a beer: paypal.me/edwinchuatech
