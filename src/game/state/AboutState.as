package game.state 
{
	import levels.leveldata.Level;
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * The about state just tells a bit about the game
	 */
	public class AboutState extends FlxState {
		
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			var t:FlxText; //I'm just declaring one text item, then making new instances of it.
			
			t = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			t.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 35, FlxG.width, "Gameplay and Sound by");
			t.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 45, FlxG.width, "Doug \"dougRiss\" Young");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 60, FlxG.width, "Made with Flixel");
			t.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(t);
			
			t = new FlxText(0, 70, FlxG.width, "flixel.org");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 90, FlxG.width, "Special Thanks:");
			t.setFormat (null, 8, 0xFFFFFFff, "center");
			add(t);
			
			t = new FlxText(0, 100, FlxG.width, "Chaotic Neutral");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 120, FlxG.width, "FlashGameDojo.com");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 110, FlxG.width, "YouCanMakeVideoGames.com");
			t.setFormat (null, 8, 0xFF6666FF, "center");
			add(t);
			
			t = new FlxText(0, 130, FlxG.width, "SFXR - Dr. Petter");
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