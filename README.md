# Clash Dash

Displays clan data in a graphical, easy to read form.

See http://nightwarriors.crazy.technology for a sample set up.


## Project Setup

### src/config.php
Replace the clantag via the `$clantag` variable. Replace `$token` with a valid token obtained from https://developer.clashofclans.com/ 

### src/cron.sh
Runs [update.php](https://github.com/EdwinChua/clash/blob/master/phpScripts/coc.php) to get a specific clan's info.

1. Set up a cron job to schedule the api calls periodically
2. Enjoy

### src/update.php

This script saves a file data/clan-info.json, containing 3 items:
 - Timestamp when script was run
 - Clan info
 - Full profile for each player in the clan

Note: This will result in ~50 API calls each time this script is run, which is why I do not call it directly on page load. 
 (1) It's slow. 
 (2) Your API calls may be blocked if called too frequently.

## Additional Info

This site uses [Chart.js](http://www.chartjs.org) charts, bootstrap, and PHP.

Feel free to open a new issue with ideas and suggestions.

Clash on!

Disclaimer: "This content is not affiliated with, endorsed, sponsored, or specifically approved by Supercell and Supercell is not responsible for it. For more information see Supercell's Fan Content Policy: www.supercell.com/fan-content-policy."

Like my work? Buy me a beer: paypal.me/edwinchuatech


# Complete Changelog

## Update to V2.1 (7 May 2018)
 - Replaced curl with file_get_contents (mostly preference, but there are some php installations that don't have curl)
 - Removed the retry loop
 - Split config in separate file
 - Removed the API key from git (saw that its a base64 encoded JSON Web Token, best practice is to not include credentials publicly)
 Thanks for this update @Jimbolino

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

