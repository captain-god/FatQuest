package game.state 
{
	import levels.leveldata.Level;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxState;

	/**
	 * The level select screen.
	 * as of alpha 1.8, this doesnt work.
	 */
	public class LevelSelectState extends FlxState
	{
		/**
		 * validate that a level code supplied is a real code.
		 * if it is legit, launch that level! otherwise, display text that says "invalid"
		 * @param levelcode - a string representing the passphrase
		 */
		private function validateLevelCode(levelcode:String):void {
			for (var i:int = 0; i < 20; i++) {
				if (levelcode == Level.levelCode[i]) {
					FlxG.switchState(new PlayState(i, 0));
				}
			}
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height/2 + 30, FlxG.width, "INVALID");
			instructions.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(instructions);
		}
		
		/**
		 * create the state
		 * @return void;
		 */
		override public function create():void {
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			title.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height/2 - 25, FlxG.width, "<coming in beta>");
			instructions.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(instructions);
			
			//uncomment this when I figure out how to do it...
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
		
	}

}