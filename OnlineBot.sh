#!/bin/bash
uuid='UUID-OF-PLAYER'
# the uuid of the player, this setting is ignored if userUsername=true.
playerName='player'
# if userUsername=true, please fill in this option, and ignore uuid=
key='HYPIXEL-API-KEY-GOES-HERE'
TGbotAPIkey='TELEGRAM-API-KEY-GOES-HERE'
TGbotChannel='CHANNEL-NUMBER-OF-TELEGRAM-CHAT'
# fill in these options
useUsername=true
# The above option determines whether the script will get the uuid based upon the username of the "playerName" variable,
# this will save you the trouble of filling in a uuid, but might also cause problems if a player changes their name.
if [ $useUsername = true ]
then
	# gets the uuid of the player from mojang's API.
	uuid=$( curl https://api.mojang.com/users/profiles/minecraft/"$playerName"?at=0 | grep -o "\"id\":\"[a-z0-9]*\"" | grep -o "\"[a-z0-9]*\"$" | sed -s 's/"//g' )
	echo uuid is "$uuid"
fi
while true
do
	runCheck=$( curl https://api.hypixel.net/status?key="$key"\&uuid="$uuid" )
	echo "$runCheck"
	isOnline=$( echo "$runCheck" | grep -o "\"online\":true")
	if [ "$isOnline" != "" ]
	then
		if [ "$playerStatus" != 'online' ]
		then
			tgMSG=$( echo "$playerName" has joined )
			playerStatus=online
			curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
		fi
		#playerStatus=offline
	else
		if [ "$playerStatus" != 'offline' ]
		then
			playerStatus=offline
			tgMSG=$( echo "$playerName" has left )
			curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
		fi
	fi
	sleep 32
done
