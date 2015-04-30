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
		private var lives:int;
		private var winStreak:int;
		private var difficulty:int;
		
		/**
		 * Constructor
		 * @param	timer - how much time you've had left in the previous round
		 * @param	score - Your cumulative score so far
		 * @param	level - the level you just beat.
		 * @param   difficulty - the difficulty you're playing at
		 */
		public function InterludeState(timer:int, score:int, level:int, difficulty:int, lives:int, winStreak:int) {
			this.level = level;
			this.score = score + ((timer * (50 * difficulty)));
			this.difficulty = difficulty;
			this.lives = lives;
			this.winStreak = winStreak;
			
			if (winStreak >= 3) {
				this.lives = lives + 1;
			}
			
			trace(lives);
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
			scoreBreakdown = new FlxText( 0, 45, FlxG.width, "Score: " + score);
			scoreBreakdown.setFormat (null, 12, 0xFFFFFFFF, "center");
			add(scoreBreakdown);
			
			var playgame:FlxButton;
			playgame = new FlxButton(FlxG.width/2-40, (FlxG.height / 2) - 10, "Continue", function ():void 
			{		
				FlxG.switchState(new PlayState(difficulty, level + 1, score, -1, winStreak, lives));
			});
			add(playgame)
			
			var mainMenu:FlxButton;
			mainMenu = new FlxButton(FlxG.width/2-40, (FlxG.height / 2)  + 10, "Main Menu", function ():void 
			{
				FlxG.switchState(new SplashState());
			});
			add(mainMenu)
			
			var livesleft:FlxText;
			livesleft = new FlxText(0, FlxG.height - 40, FlxG.width, "Lives remaining: " + lives);
			livesleft.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(livesleft);
			
			if (winStreak >= 3) {
				winStreak = 0;
				var livesBonus:FlxText;
				livesBonus = new FlxText(0, FlxG.height - 30, FlxG.width, "+1 life for win streak!");
				livesBonus.setFormat (null, 8, 0xFFFFFFFF, "center");
				add(livesBonus);
			}
		}
	}

}