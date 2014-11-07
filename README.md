FlashUtil
=========

A basic utility for ansynchronous data requests to the flash UI.

Setup
=========
 - Add the swf file to your UI (put the swf in resource/flash3/ and add entry in custom_ui.txt)
 - Add the event in script/custom_events.txt
 - Require FlashUtil.lua in your lua

How to use
=========
Once required in your lua script you can request data from the global FlashUtil object. Once the data is recieved the callback you passed will be called.
Data can be requested to one specific player's UI or to all UIs, executing only the callback of the first UI that returns data.
Currently only three data-retrieval functions are required (feel free to extend!):

 - FlashUtil:GetPlayerName( playerID, callback )
 - FlashUtil:GetCursorPos( playerID, callback )
 - FlashUtil:GetCursorWorldPos( playerID, callback )

If a function is called with playerID -1 it will request the data from every client, executing the callback for the first return.