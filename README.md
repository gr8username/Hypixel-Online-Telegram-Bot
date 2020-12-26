# Hypixel online telegram bot

This is a Telegram bot shell script that using the Hypixel api to send a message when specified player(s) joins the Hypixel Minecraft server. It does this by checking the Hypixel API to see if a player is online every 10 seconds.

Dependencies:
* Bash
* command-line cURL
* basic utilities included in the vast majority of GNU/Linux distributions such as ```grep```


## This project is **NOT** affiliated with Hypixel.
## NOTE: this is meant to be used by the user hosting it, and offers no functionality for usage by other users, or adding users by messaging.

## Guide:
* Download the OnlineBot.sh file from the repository.

Change the variables near the top of the shell script (ex. ```key='HYPIXEL-API-KEY-GOES-HERE```)
* to obtain a Hypixel API key, please login ingame and run the command /key.

Obtaining the Telegram API key, instructions can be found on [https://core.telegram.org/bots](https://core.telegram.org/bots)

Once the API key for the bot has been obtained, you must send the bot a message and figure out the chat ID. This can usually be obtained by making a GET request to ```https://api.telegram.org/bot<API-KEY>/getUpdates``` and finding the chat id section of the json for the message you previously sent to the bot. You can also open the url (**with the Telegram api key filled in**) with a web browser


This repository is avaliabe on both GitHub and GitLab.

[https://github.com/gr8username/Hypixel-Online-Telegram-Bot](https://github.com/gr8username/Hypixel-Online-Telegram-Bot)

[https://gitlab.com/Really-Random-User/hypixel-online-telegram-bot](https://gitlab.com/Really-Random-User/hypixel-online-telegram-bot)

