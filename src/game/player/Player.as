package game.player 
{
	import assets.Asset;
	import org.flixel.*;
	
	public class Player extends FlxSprite 
	{
		//the player's girth will expand when they collect food
		private var girth:int = 5;
		
		//Constructor
		public function Player(x:int, y:int, size:int) 
		{
			this.x = x;
			this.y = y;
			girth = size;
			
			loadGraphic(assets.Asset.playerPNG, false, false, girth, girth);
		}
		
		//get the girth
		public function getGirth():int {
			return girth;
		}
		
		public function getX():int {
			return x;
		}
		
		public function getY():int {
			return y;
		}
		//it's worth noting that this extends FlxSprite, which has a get method for x and y
		
		//Updates every tick
		override public function update():void {
			if (FlxG.keys.pressed("W")) {
				y -= 1;
			}
			
			if (FlxG.keys.pressed("S")) {
				y += 1;
			}
			
			if (FlxG.keys.pressed("A")) {
				x -= 1;
			}
			
			if (FlxG.keys.pressed("D")) {
				x += 1;
			}
			
			super.update();
		}
	}

}