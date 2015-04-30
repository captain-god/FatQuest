package game.state 
{
	import assets.Asset;
	import levels.leveldata.Level;
	import levels.Loader;
	import game.objects.Goodie;
	import game.player.Player;
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	
	
	/**
	 * This is the state that the game plays from. All the hard work happens here.
	 */
	public class PlayState extends FlxState 
	{
		public static const DIFFICULTY_HARD:int = 3;
		public static const DIFFICULTY_MEDIUM:int = 2;
		public static const DIFFICULTY_EASY:int = 1;
		
		private var player:         FlxGroup; //groups all the players: see growPlayer for more info
		private var playerToken:    Player; //The actual representation of the player.
		private var goodies:        FlxGroup; //group for easy access
		private var currentLevelMap:FlxTilemap; //the tilemap for the current level
		private var grandScore:     int; // the overall score the player has cumulated
		private var currentLevel:   int; // the current level you're playing on
		private var tileSize:       int     = 8; //hardcoded for the time being
		private var elapsedTime:    Number  = 0; //Obviously no time has passed.
		private var timeLimit:      int     = 30; //global time limit; to be set by config file later
		private var playing:        Boolean = true; //turns to false when you win or lose
		private var somethingBroke: Boolean = false; //for sloppy, uneffective debugging.
		private var currentScore:   int     = 0; //the score the user has gained from picking up blips
		private var difficulty:     int; //the difficulty of the level, defined up top
		private var winStreak:      int; //how many rounds in a row has the player won?
		private var livesLeft:      int; // how many lives does the player have left?
		
		//Just some text fields.
		private var scoreTxt:       FlxText;
		private var currentLvlTxt:  FlxText;
		private var timeTxt:        FlxText;
		private var loseTxt:        FlxText;
		
		/**
		 * constructor
		 * @param   diff - the difficulty for the level
		 * @param	level - the level to load; default 1
		 * @param	score - the score from any previous rounds; default 0
		 * @param   timer - the time to set to before you restart; default -1; If timer == -1, it sets the time
		 * to (75 - (difficulty * 15)), meaning difficulty 1 (easy) = 60 seconds
		 */
		public function PlayState(diff:int, level:int = 1, score:int = 0, timer:int = -1, winstreak:int = 0, lives:int = 0 ):void {
			difficulty = diff;
			currentLevel = level;
			grandScore = score;
			winStreak = winstreak;
			livesLeft = lives;
			
			if (timer == -1) {
				timeLimit = 75 - (difficulty * 15);
			}
			else timeLimit = timer;
		}
		
		/**
		 * Create the state
		 */
		override public function create():void {
			FlxG.bgColor = 0xfff2f0f2;
			FlxG.play(Asset.woop_1MP3);
			
			player = new FlxGroup();
			playerToken = new Player(tileSize, tileSize, 5);
			player.add(playerToken);
			
			//try loading the map and goodies; else, fail, catch the error
			//and pass it into our ErrorState so we can see what happened.
			try {
				currentLevelMap = Loader.getMap(currentLevel, tileSize);
				goodies = Loader.getGoodies(currentLevel, tileSize);
				
				scoreTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Remaining: " + goodies.countLiving());
				scoreTxt.setFormat ( null, 8, 0xFF000000, "left");
				
				currentLvlTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Level " + currentLevel);
				currentLvlTxt.setFormat ( null, 8, 0xFF000000, "right");
				
				timeTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Time: " + timeLimit);
				timeTxt.setFormat ( null, 8, 0xFF000000, "center");
				
				loseTxt = new FlxText( 0, FlxG.height/2-8, FlxG.width, "Out of Time!");
				loseTxt.setFormat ( null, 8, 0xFFFF0000, "center");
				
				add(currentLevelMap);
				add(goodies);
				add(player);
				add(scoreTxt);
				add(currentLvlTxt);
				add(timeTxt);
			} 
			catch (err:Error) {
				FlxG.switchState(new ErrorState(err.message, grandScore));
			}		
		}
		
		/**
		 * Update is called every tick; 
		 * it is the game loop, always checking to see what's happening.
		 */
		override public function update():void {
			//If you try to load a level that does not exist,
			//you'll get a gamebreaking exception when you try to do "isRoundOver"
			try {
				countDown();
				isRoundOver();

				if (playing && FlxG.keys.SPACE) {
					FlxG.switchState(new PlayState(difficulty, currentLevel, grandScore, timeLimit, winStreak, livesLeft));
				}

				super.update();

				FlxG.collide(currentLevelMap,player);

				FlxG.overlap(goodies, player, getGoodie);
			}
						
			catch (err:Error) {
				FlxG.switchState(new ErrorState(err.message, grandScore));
			}
		}
		
		/**
		 * counts down from the time limit by adding tiny numbers every tick.
		 */
		private function countDown():void {
			elapsedTime += FlxG.elapsed;
			
			if (elapsedTime >= 1) {
				timeLimit--;
				timeTxt.text = "Time: " + timeLimit;
				elapsedTime -= 1;
			}
			if (timeLimit <= 10) {
				timeTxt.setFormat(null, 8, 0xFF0000);
			}
		}
		
		/**
		 * always checking to see if the round is over;
		 * if it is, one of these two will do something,
		 * otherwise the game continues as normal.
		 */
		private function isRoundOver():void {
			if (timeLimit <= 0) {
				if (livesLeft == 0) {
					FlxG.switchState(new LosingState(timeLimit, grandScore + currentScore, currentLevel, difficulty, livesLeft));					
				}
				else {
					livesLeft--
					trace(livesLeft);
					FlxG.switchState(new LosingState(timeLimit, grandScore + currentScore, currentLevel, difficulty, livesLeft));
				}
			}
			else if (goodies.countLiving() == 0 && goodies.countDead() > 0) {
				//check to see if this is the last round!
				if (currentLevel  == Level.LAST_LEVEL) {
					FlxG.switchState(new WinningState(timeLimit, grandScore + currentScore, currentLevel, difficulty, livesLeft));
				}
				else {
					FlxG.switchState(new InterludeState(timeLimit, grandScore + currentScore, currentLevel, difficulty, livesLeft, winStreak + 1));
				}
			}

		}
		
		/**
		 * Called when a player and a goodie collide; this will give the player
		 * points and remove the goodie from the game.
		 * @param	goodie - the goodie the player came in contact with
		 * @param	player - the player token
		 * it's worth noting this is taken from the EZPlatformer demonstration
		 * on flashgamedojo.com. It was a huge help, Thanks :D!
		 */
		public function getGoodie(goodie:FlxSprite,player:FlxSprite):void {
			goodie.kill();
			FlxG.play(Asset.plip_1MP3,.2);
			scoreTxt.text = "Remaining: " + (goodies.countLiving());
			currentScore += 10;
			if (goodies.countDead() % 2 == 0) {
				growPlayer();
			}
		}
		
		/**
		 * When the player has eaten 2 blips, they grow the next size up
		 * Added some compensation handles to make sure that you get stuck
		 * in the wall as little as possible.
		 */
		public function growPlayer():void {
			var x:int = playerToken.getX();
			var y:int = playerToken.getY();
			var z:int = playerToken.getGirth() + 1;
			
			if (FlxG.keys.S) {
				y -= 1;
			}
			if (FlxG.keys.W) {
				y += 1;
			}
			if (FlxG.keys.A) {
				x += 1;
			}
			if (FlxG.keys.D) {
				x -= 1;
			}
			
			//take the old token out of the game, then make a new one in the old one's place
			player.remove(playerToken);
			playerToken = new Player(x, y, z);
			player.add(playerToken);
		}
	}
}