#!/bin/bash
playerName[0]='player'
# playerName[1]='player 2'
# specify the names of the players you wish to recieve notifications for, to add multiple players
# add a line with playerName[2]='PLAYER2', playerName[3]='PLAYER3' etc.
key='HYPIXEL-API-KEY-GOES-HERE'
# hypixel API key
TGbotAPIkey='TELEGRAM-API-KEY-GOES-HERE'
# Telegram API key
TGbotChannel='TELEGRAM-CHAT-CHANNEL-NUMBER'
# Telegram chat channel
for index in ${!playerName[*]}
do
	echo player is ${playerName[$index]}
	playerUUID[$index]=$( curl https://api.mojang.com/users/profiles/minecraft/${playerName[$index]}?at=0 | grep -o "\"id\":\"[a-z0-9]*\"" | grep -o "\"[a-z0-9]*\"$" | sed -s 's/"//g' )
	echo uuid for "${playerName[$index]}" is "${playerUUID[$index]}"
done
while true
do
	for index in ${!playerName[*]}
	do
		runCheck=$( curl https://api.hypixel.net/status?key="$key"\&uuid="${playerUUID[$index]}" )
		echo "$runCheck"
		isOnline=$( echo "$runCheck" | grep -o "\"online\":true")
		if [ "$isOnline" != "" ]
		then
			if [ "${playerStatus[$index]}" != 'online' ]
			then
				tgMSG=$( echo "${playerName[$index]}" has joined )
				playerStatus[$index]=online
				curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
			fi
			#playerStatus=offline
		else
			if [ "${playerStatus[$index]}" != 'offline' ]
			then
				playerStatus[$index]=offline
				tgMSG=$( echo "${playerName[$index]}" has left )
				curl https://api.telegram.org/bot"$TGbotAPIkey"/sendMessage?chat_id="$TGbotChannel"\&text="$tgMSG"
			fi
		fi
		sleep 10
	done
done
