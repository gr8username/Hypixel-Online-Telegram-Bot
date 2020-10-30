#!/bin/bash
uuid='MINECRAFT-UUID-OF-PLAYER-YOU-WISH-TO-RECIEVE-NOTIFICATIONS-WHILE-ONLINE'
playerName='player'
# this should contain the player that you wish to recieve notifications while online, THE ONLY EFFECT THIS HAS IS WHAT THE TELEGRAM MESSAGE SAYS, HAS NO EFFECT ON WHICH PLAYER IS CHECKED
key='HYPIXEL-API-KEY-GOES-HERE'
TGbotAPIkey='YOUR-TELEGRAM-API-KEY-GOES-HERE'
TGbotChannel='123456'
echo press ctrl+c to quit
while true
do
	runCheck=$( curl https://api.hypixel.net/status?key="$key"\&uuid="$uuid" )
	# parse the variable for '"online":true'
	isOnline=$( echo "$runCheck" | grep -o "\"online\":true")
	if [ "$isOnline" != "" ]
	then
		if [ "$playerStatus" != 'online' ]
		then
			tgMSG=$( echo "$playerName" has joined )
			playerStatus=online
			curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
		fi
	else
		if [ "$playerStatus" != 'offline' ]
		then
			playerStatus=offline
			tgMSG=$( echo "$playerName" has left )
			# send the message
			curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
		fi
	fi
	# wait 32 seconds before the check happens again
	sleep 32
done
