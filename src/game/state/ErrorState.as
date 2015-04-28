package game.state 
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author dougRiss
	 */
	public class ErrorState extends FlxState
	{
		private var message:String;
		private var score:int
		
		public function ErrorState(msg:String, score:int) {
			this.message = msg;
			this.score = score;
		}
		
		override public function create():void {
			var t:FlxText = new FlxText( 0, FlxG.height / 2 - 10, FlxG.width, "Oh, fuck! Error:");
			t.setFormat(null, 8, 0x000000, "center");
			add(t);
			
			t = new FlxText( 0, FlxG.height / 2, FlxG.width, message);
			t.setFormat(null, 8, 0x000000, "center");
			add(t);
			
			t = new FlxText( 0, FlxG.height / 2 + 10, FlxG.width, "Final Score: " +score);
			t.setFormat(null, 8, 0x000000, "center");
			add(t);
		}
		
		override public function update():void {
		}
		
	}

}