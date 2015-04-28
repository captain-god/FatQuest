package game.state 
{
	import assets.Asset;
	import org.flixel.*;
	
	public class LaunchState extends FlxState
	{
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			title.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(title);
			
			var playgame:FlxButton;
			playgame = new FlxButton(FlxG.width/2-40, FlxG.height / 2 - 30, "Play", function ():void 
			{
				FlxG.music.stop();
				FlxG.switchState(new PlayState());
			});
			add(playgame)
			
			var instructions:FlxButton;
			instructions = new FlxButton(FlxG.width/2-40, FlxG.height / 2 - 10, "Instructions", function ():void 
			{
				FlxG.switchState(new InstructionState());
			});
			add(instructions)
			
			var levelSelect:FlxButton;
			levelSelect = new FlxButton(FlxG.width/2-40, FlxG.height / 2 + 10, "Select Level", function ():void 
			{
				FlxG.switchState(new LevelSelectState);
			});
			add(levelSelect)
			
			var info:FlxButton;
			info = new FlxButton(FlxG.width/2-40, FlxG.height / 2 + 30, "About", function ():void 
			{
				FlxG.switchState(new AboutState);
			});
			add(info)
			
			var cngames:FlxText;
			cngames = new FlxText(0, FlxG.height - 20, FlxG.width, "Created by Chaotic Neutral Games");
			cngames.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(cngames);
		}
 
		override public function update():void {
			super.update(); 
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.switchState(new PlayState(4));
			}
		}
		
		public function LaunchState() {
			super();
		}
	}
}