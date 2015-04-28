package game.state 
{
	import assets.Asset;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	/**The state where the splash logo loads
	 */
	
	public class SplashState extends FlxState 
	{
		override public function create():void {
			FlxG.playMusic(Asset.themesongMP3, 0.5);
			FlxG.switchState(new LaunchState());
		}
	}
}