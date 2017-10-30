# Clash Dashboard

Displays clan data in a graphical, easy to read form.

See http://nightwarriors.crazy.technology for a sample set up.

## Project Setup

### scripts/cron.sh 
Runs [coc.php](https://github.com/EdwinChua/clash/blob/master/phpScripts/coc.php) to get a specific clan's info.

Set up a cron job to schedule the api calls periodically

### phpScripts/coc.php
Get's clan info via clan tag specified by `$clantag` variable. Replace `$token` with your valid token. 

This script saves a file saved-data/clan-info.json, containing 3 items:
 - Date and time script was run
 - Clan info
 - Full profile for each player in the clan

Note: This will result in ~50 API calls each time this script is run, which is why I do not call it directly on page load. 
 (1) It's slow. 
 (2) Your API calls may be blocked if called too frequently.

### phpScripts/return-saved-data.php
Responds with the saved-data/clan-info.json. Modify to suit your needs

## Additional Info

This site uses [Chart.js](http://www.chartjs.org) charts, bootstrap, and PHP.

Feel free to open a new issue with ideas and suggestions.

Clash on!

Disclaimer: "This content is not affiliated with, endorsed, sponsored, or specifically approved by Supercell and Supercell is not responsible for it. For more information see Supercell's Fan Content Policy: www.supercell.com/fan-content-policy."

Like my work? Buy me a beer: paypal.me/edwinchuatech
