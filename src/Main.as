package
{
	import game.state.SplashState;
	import org.flixel.*;
	
	[SWF(width = "800", height = "640", backgroundColor = "#000000")] 
	
	public class Main extends FlxGame {
		public function Main() {
			super(200, 160, SplashState, 4, 60, 30, true);
		} 
	}
}