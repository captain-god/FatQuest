package game.state 
{
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import org.flixel.FlxButton;

	public class InstructionState extends FlxState{
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			var t:FlxText;
			
			t = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			t.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 35, FlxG.width, "Move around with:");
			t.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 45, FlxG.width, "WASD");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 60, FlxG.width, "Collect All the Food to Advance");
			t.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 70, FlxG.width, "The little blips are food!");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 90, FlxG.width, "Gameplay:");
			t.setFormat (null, 8, 0xFFFFFFff, "center");
			add(t);
			
			t = new FlxText(0, 100, FlxG.width, "Food makes you grow, so try to");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 110, FlxG.width, "get the blips in tight spots first!");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 120, FlxG.width, "Press Space to restart a level.");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			var mainMenu:FlxButton;
			mainMenu = new FlxButton(FlxG.width/2-40, FlxG.height - 20, "Back", function ():void 
			{
				FlxG.switchState(new LaunchState());
			});
			add(mainMenu);
		}
	}

}