package {
	import flash.display.MovieClip;

	//import some stuff from the valve lib
	import ValveLib.Globals;
	import ValveLib.ResizeManager;
	
	public class FlashUtil extends MovieClip{
		
		//these three variables are required by the engine
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;
		
		//constructor, you usually will use onLoaded() instead
		public function FlashUtil() : void {

		}
			
		//this function is called when the UI is loaded
		public function onLoaded() : void {		
			this.gameAPI.SubscribeToGameEvent("FlashUtil_request", this.onRequest);
		
			trace("FlashUtil UI loaded");
		}
		
		private function onRequest( args:Object ) {
			if (globals.Players.GetLocalPlayer() == args.target_player || args.target_player == -1){
				var returnStr:String = "FlashUtil_return " + args.request_id + ";";
				returnStr += globals.Players.GetLocalPlayer()+";";
				
				if (args.data_name == 'player_name') {
					returnStr += 'String;' + globals.Players.GetPlayerName(globals.Players.GetLocalPlayer());
				} else if (args.data_name == 'cursor_position') {
					returnStr += 'Vector2;' + stage.mouseX + "," + stage.mouseY;
				} else if (args.data_name == 'cursor_position_world') {
					var pos:Array = globals.Game.ScreenXYToWorld(stage.mouseX, stage.mouseY);
					returnStr += 'Vector3;' + pos[0] + "," + pos[1] + "," + pos[2];
				}
				
				trace('Returning: "'+returnStr+'"');
				this.gameAPI.SendServerCommand(returnStr);
			}
		}
	}
}