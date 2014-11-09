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
# Single requests
Once required in your lua script you can request data from the global FlashUtil object. Once the data is recieved the callback you passed will be called.
Data can be requested to one specific player's UI or to all UIs, executing only the callback of the first UI that returns data.
Currently only three data-retrieval functions are required (feel free to extend!):

 - FlashUtil:GetPlayerName( playerID, callback )
 - FlashUtil:GetCursorPos( playerID, callback )
 - FlashUtil:GetCursorWorldPos( playerID, callback )

If a function is called with playerID -1 it will request the data from every client, executing the callback for the first return.

# Stream requests
Data streams can be requested for a stream of data from a flash UI. This means the UI will start transmitting the requested data at a specified interval until it is told to stop.
Every time a response is received the callback will be called.

Request a stream:
stream = FlashUtil:RequestDataStream( dataName, RPS, playerID, callback )

Stop a data stream:
FlashUtil:StopDataStream( stream )

The dataName parameter determines what data is requested from the UI. Currently supported data:
 - cursor_position - The cursor position in screen coordinates
 - cursor_position_world - The cursor position in world coordinates