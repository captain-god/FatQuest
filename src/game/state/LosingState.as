package game.state 
{
	import assets.Asset;
	import levels.leveldata.Level;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxState;
	
	/**
	 * The state you arrive at when you lose
	 */
	public class LosingState extends FlxState
	{
		private var score:int;
		private var level:int;
		private var timer:int;
		
		/**
		 * constructor
		 * @param	timer - this is actually useless, it should be 0 if you're here...
		 * @param	score - Your grand score before you died.
		 * @param	level - the level you made it to.
		 */
		public function LosingState(timer:int, score:int, level:int) {
			this.timer = timer;
			this.score = score;
			this.level = level;
			trace(level)
		}
		
		/**
		 * Create this state
		 */
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			FlxG.play(Asset.loseMP3);
			
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "You reached level " + (level));
			title.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(title);
			
			var scoreBreakdown:FlxText;
			scoreBreakdown = new FlxText( 0, 45, FlxG.width, "Score: " + (score + (timer * 100)));
			scoreBreakdown.setFormat (null, 12, 0xFFFFFFFF, "center");
			add(scoreBreakdown);
			
			var playgame:FlxButton;
			playgame = new FlxButton(FlxG.width/2-40, (FlxG.height / 2) - 10, "Retry", function ():void 
			{
				FlxG.switchState(new PlayState());
			});
			add(playgame)
			
			var mainMenu:FlxButton;
			mainMenu = new FlxButton(FlxG.width/2-40, (FlxG.height / 2)  + 10, "Main Menu", function ():void 
			{
				FlxG.switchState(new SplashState());
			});
			add(mainMenu)
			
			var levelcodetext:FlxText;
			levelcodetext = new FlxText(0, FlxG.height - 40, FlxG.width, "Level " + (level + 1) + "'s passphrase is");
			levelcodetext.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(levelcodetext);
			
			var levelcode:FlxText;
			levelcode = new FlxText(0, FlxG.height - 30, FlxG.width, Level.levelCode[level +1]);
			levelcode.setFormat (null, 8, 0xFFFF0000, "center");
			add(levelcode);
		}
	}

}