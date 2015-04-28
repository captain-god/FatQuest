package
{
	import game.state.SplashState;
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "640", backgroundColor = "#000000")] 
	
	/**
	 * Pay this no mind, this is just the start of the thing.
	 */
	public class Main extends FlxGame {
		public function Main() {
			super(200, 160, SplashState, 4, 60, 30, true);
		} 
	}
}