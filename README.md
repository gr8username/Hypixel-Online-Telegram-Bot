# Hypixel online telegram bot

This is a Telegram bot shell script that using the Hypixel api to send one a message when a player goes online.

Dependencies:
* Bash
* command-line cURL
* basic utilities included in the vast majority of GNU/Linux distributions such as ```grep```


## Disclaimer: This project is **NOT** affiliated with Hypixel.
## NOTE: this is meant to be used by the user hosting it, and offers no functionality for usage by other users, or adding users by messaging. the bot

## Guide:

Change the variables near the top of the shell script (ex. ```key='HYPIXEL-API-KEY-GOES-HERE```)
* to obtain a Hypixel API key, please login ingame and run the command /key.

Obtaining the Telegram API key, instructions can be found on [https://core.telegram.org/bots](https://core.telegram.org/bots)

Once the API key for the bot has been obtained, you must send the bot a message and figure out the chat ID. This can usually be obtained by making a GET request to ```https://api.telegram.org/bot<API-KEY>/getUpdates``` and finding the chat id section of the json for the message you previously sent to the bot. You can also open the url (**with the Telegram api key filled in**) with a web browser

Then figure out the uuid of the player this can be done most easily with (NameMC)[https://namemc.com], replace