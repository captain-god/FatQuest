package game.objects 
{
	import assets.Asset;
	import org.flixel.FlxSprite;
	/**
	 * @author dougRiss
	 * A rather abstract implementation of a powerup
	 */
	public class Goodie extends FlxSprite {
		
		public function Goodie(x:int, y:int) {
			this.x = x;
			this.y = y;
			
			loadGraphic(Asset.playerPNG, false, false, 2, 4);
			
		}
		
	}

}