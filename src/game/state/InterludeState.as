package game.state 
{
	import assets.Asset;
	import levels.leveldata.Level;
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	/**
	 * The state you arrive at upon completing a level
	 */
	public class InterludeState extends FlxState
	{
		private var score:int;
		private var level:int;
		private var timer:int;
		
		/**
		 * Constructor
		 * @param	timer - how much time you've had left in the previous round
		 * @param	score - Your cumulative score so far
		 * @param	level - the level you just beat.
		 */
		public function InterludeState(timer:int, score:int, level:int) {
			this.timer = timer;
			this.score = score;
			this.level = level;
		}
		
		/**
		 * Create the state.
		 */
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			FlxG.play(Asset.woop_1MP3);
			
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "LEVEL " + (level) + " COMPLETE");
			title.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(title);
			
			var scoreBreakdown:FlxText;
			scoreBreakdown = new FlxText( 0, 45, FlxG.width, "Score: " + (score + (timer * 100)));
			scoreBreakdown.setFormat (null, 12, 0xFFFFFFFF, "center");
			add(scoreBreakdown);
			
			var playgame:FlxButton;
			playgame = new FlxButton(FlxG.width/2-40, (FlxG.height / 2) - 10, "Continue", function ():void 
			{
				FlxG.switchState(new PlayState(level + 1, score + (timer * 100)));
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