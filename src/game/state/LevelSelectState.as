package game.state 
{
	import levels.leveldata.Level;
	import org.flixel.*;

	public class LevelSelectState extends FlxState
	{
		/* validate that a level code supplied is a real code
		 * @param levelcode - a string representing the passphrase
		 * @return void
		 */
		private function validateLevelCode(levelcode:String):void {
			for (var i:int = 0; i < 99; i++) {
				if (levelcode == Level.levelCode[i]) {
					FlxG.switchState(new PlayState(1, 0));
				}
			}
			
			//if nothing was matched...
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height/2 + 30, FlxG.width, "INVALID");
			instructions.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(instructions);
		}
		
		/* create the state
		 * @return void;
		 */
		override public function create():void {
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			title.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height/2 - 25, FlxG.width, "<I'm not done yet>");
			instructions.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(instructions);
			
			//var gobutton:FlxButton;
			//gobutton = new FlxButton(FlxG.width/2-40, FlxG.height/2 , "Go!", validateLevelCode);
			//add(gobutton);
			
			var gobutton:FlxButton;
			gobutton = new FlxButton(FlxG.width/2 - 40, FlxG.height/2 + 10 , "Go back", function ():void 
			{
				FlxG.switchState(new LaunchState);
			});
			add(gobutton);
			
			var cngames:FlxText;
			cngames = new FlxText(0, FlxG.height - 20, FlxG.width, "Created by Chaotic Neutral Games");
			cngames.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(cngames);
		}
 
		/* Update per tick
		 * @return void
		 */
		override public function update():void {
			super.update(); 
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.switchState(new PlayState(1, 0));
			}
		}
		
		/* constructor
		 * @return void
		 */
		public function LevelSelectState() {
			super();
		}
		
	}

}