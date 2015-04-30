package game.player 
{
	import assets.Asset;
	import org.flixel.*;
	
	/**
	 * The player class
	 */
	public class Player extends FlxSprite 
	{
		//the player's girth will expand when they collect food, so this gets larger as the game progresses
		private var girth:int = 5;
		
		/**
		 * Constructor
		 * @param	x - the x position of the player when spawning
		 * @param	y - the y position of the player when spawning
		 * @param	size - the 'girth' of the player, or its dimensions, more specifically
		 */
		public function Player(x:int, y:int, size:int) 
		{
			this.x = x;
			this.y = y;
			girth = size;
			
			loadGraphic(assets.Asset.playerPNG, false, false, girth, girth);
		}
		
		/**
		 * returns the size of the character
		 * @return int telling how big we are
		 */
		public function getGirth():int {
			return girth;
		}
		
		/**
		 * returns the x of the character
		 * @return the x position
		 */
		public function getX():int {
			return x;
		}
		
		/**
		 * returns the y of the character
		 * @return the y position
		 */
		public function getY():int {
			return y;
		}
		
		/**
		 * Updates every tick;
		 * checking to see which buttons are pressed, and, if any
		 * which direction to move the character around.
		 * Beta 1.0.3 supports WASD and Arrow Keys!
		 */
		override public function update():void {
			if (FlxG.keys.pressed("W") || FlxG.keys.pressed("UP")) {
				y -= 1;
			}
			
			if (FlxG.keys.pressed("S") || FlxG.keys.pressed("DOWN")) {
				y += 1;
			}
			
			if (FlxG.keys.pressed("A") || FlxG.keys.pressed("LEFT")) {
				x -= 1;
			}
			
			if (FlxG.keys.pressed("D") || FlxG.keys.pressed("RIGHT")) {
				x += 1;
			}
			
			super.update();
		}
	}

}