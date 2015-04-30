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
		private var lives:int;
		private var diff:int;
		
		/**
		 * constructor
		 * @param	timer - this is actually useless, it should be 0 if you're here...
		 * @param	score - Your grand score before you died.
		 * @param	level - the level you made it to.
		 */
		public function LosingState(timer:int, score:int, level:int, difficulty:int, lives:int = 0 ) {
			this.timer = timer;
			this.score = score;
			this.level = level;
			this.lives = lives;
			this.diff = difficulty;
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
			
			if (lives > 0) {
				var livesLeft:FlxText;
				livesLeft = new FlxText( 0, 45, FlxG.width, "Lives remaining: " + lives);
				livesLeft.setFormat (null, 12, 0xFFFFFFFF, "center");
				add(livesLeft);
			}
			else {
				var scoreBreakdown:FlxText;
				scoreBreakdown = new FlxText( 0, 45, FlxG.width, "Score: " + (score + (timer * 100)));
				scoreBreakdown.setFormat (null, 12, 0xFFFFFFFF, "center");
				add(scoreBreakdown);
			}
			
			if (lives > 0) {
				var playgame:FlxButton;
				playgame = new FlxButton(FlxG.width/2-40, (FlxG.height / 2) - 10, "Retry", function ():void 
				{
					FlxG.switchState(new PlayState(diff, level, score, -1, 0, lives));
				});
				add(playgame)
			}
			
			var mainMenu:FlxButton;
			mainMenu = new FlxButton(FlxG.width/2-40, (FlxG.height / 2)  + 10, "Main Menu", function ():void 
			{
				FlxG.switchState(new SplashState());
			});
			add(mainMenu)
		}
	}

}