package game.state 
{
	import assets.Asset;
	import levels.Loader;
	import game.objects.Goodie;
	import game.player.Player;
	import org.flixel.*;
	
	public class PlayState extends FlxState 
	{
		private var player:			FlxGroup;
		private var playerToken:	Player;
		private var goodies:		FlxGroup;
		private var currentLevelMap:FlxTilemap;
		private var grandScore:		int;
		private var currentLevel:	int;
		private var tileSize:		int 	= 8; //hardcoded for the time being
		private var elapsedTime:	Number 	= 0; //basepoint
		private var timer:			int 	= 30; //global time limit; to be set by config file later
		private var playing:		Boolean = true;
		private var somethingBroke: Boolean = false;
		private var currentScore: 	int 	= 0;
		
		private var scoreTxt:		FlxText;
		private var currentLvlTxt:	FlxText;
		private var timeTxt:		FlxText;
		private var loseTxt:		FlxText;
		
		public function PlayState(level:int=1, score:int=0):void {
			currentLevel = level;
			grandScore = score;
		}
		
		override public function create():void {
			FlxG.bgColor = 0xfff2f0f2;
			FlxG.play(Asset.woop_1MP3);
			
			player = new FlxGroup();
			playerToken = new Player(tileSize, tileSize, 5);
			player.add(playerToken);
			currentLevelMap = Loader.getMap(currentLevel, tileSize);
			
			if (currentLevelMap == null) {
				FlxG.switchState(new ErrorState("No more maps remaining!", grandScore));
				somethingBroke = true;
			} else {
				goodies = Loader.getGoodies(currentLevel, tileSize);
				
				scoreTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Remaining: " + goodies.countLiving());
				scoreTxt.setFormat ( null, 8, 0xFF000000, "left");
				
				currentLvlTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Level " + currentLevel);
				currentLvlTxt.setFormat ( null, 8, 0xFF000000, "right");
				
				timeTxt = new FlxText( 0, FlxG.height -15, FlxG.width, "Time: " + timer);
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
		}
		
		override public function update():void {
			if (somethingBroke) return;
			countDown();
			isRoundOver();
			
			if (playing == false && FlxG.keys.SPACE) {
				FlxG.switchState(new SplashState());
			}
			
			if (playing && FlxG.keys.SPACE) {
				FlxG.switchState(new PlayState( currentLevel,grandScore));
			}
			
			super.update();
			
			FlxG.collide(currentLevelMap,player);
			
			FlxG.overlap(goodies, player, getGoodie);
		}
		
		private function countDown():void {
			elapsedTime += FlxG.elapsed;
			
			if (elapsedTime >= 1) {
				timer--;
				timeTxt.text = "Time: " + timer;
				elapsedTime -= 1;
			}
			if (timer <= 10) {
				timeTxt.setFormat(null, 8, 0xFF0000);
			}
		}
		
		private function isRoundOver():void {
			if (timer <= 0) {
				FlxG.switchState(new LosingState(timer, grandScore + currentScore, currentLevel));
			}
			else if (goodies.countLiving() == 0 && goodies.countDead() > 0) {
				FlxG.switchState(new WinningState(timer, grandScore + currentScore, currentLevel));
			}
		}
		
		public function getGoodie(goodie:FlxSprite,player:FlxSprite):void {
			goodie.kill();
			FlxG.play(Asset.plip_1MP3,.2);
			scoreTxt.text = "Remaining: " + (goodies.countLiving());
			currentScore += 10;
			if (goodies.countDead() % 2 == 0) {
				growPlayer();
			}
		}
		
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
			
			player.remove(playerToken);
			playerToken = new Player(x, y, z);
			player.add(playerToken);
		}
	}
}