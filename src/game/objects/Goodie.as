package game.objects 
{
	import assets.Asset;
	import org.flixel.FlxSprite;
	
	/**
	 * @author dougRiss
	 * A very unexciting class, this is our blip that we see on screen.
	 */
	public class Goodie extends FlxSprite {
		/**
		 * Constructor
		 * @param	x - the x position to spawn this goodie at
		 * @param	y - the y position to spawn this goodie at
		 */
		public function Goodie(x:int, y:int) {
			this.x = x;
			this.y = y;
			
			loadGraphic(Asset.playerPNG, false, false, 2, 4);
			
		}
		
	}

}