package game.state 
{
	import levels.leveldata.Level;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxState;

	/**
	 * The difficulty select screen.
	 */
	public class DifficultySelectState extends FlxState
	{
		
		/**
		 * create the state
		 * @return void;
		 */
		override public function create():void {
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "FATQUEST");
			title.setFormat (null, 30, 0xFFFFFFFF, "center");
			add(title);
			
			var easy:FlxButton;
			easy = new FlxButton(FlxG.width/2-40, FlxG.height / 2 - 30, "Easy", function ():void 
			{
				FlxG.music.stop();
				FlxG.switchState(new PlayState(PlayState.DIFFICULTY_EASY, 1, 0, -1, 0, 3));
			});
			add(easy)
			
			var medium:FlxButton;
			medium = new FlxButton(FlxG.width/2-40, FlxG.height / 2 - 10, "Medium", function ():void 
			{
				FlxG.music.stop();
				FlxG.switchState(new PlayState(PlayState.DIFFICULTY_MEDIUM, 1, 0, -1, 0, 2));
			});
			add(medium)
			
			var hard:FlxButton;
			hard = new FlxButton(FlxG.width/2-40, FlxG.height / 2 + 10, "Hard", function ():void 
			{
				FlxG.music.stop();
				FlxG.switchState(new PlayState(PlayState.DIFFICULTY_HARD, 1, 0, -1, 0, 1));
			});
			add(hard)
			
			
			var gobutton:FlxButton;
			gobutton = new FlxButton(FlxG.width/2 - 40, FlxG.height/2 + 30 , "Go back", function ():void 
			{
				FlxG.switchState(new LaunchState);
			});
			add(gobutton);
			
			var cngames:FlxText;
			cngames = new FlxText(0, FlxG.height - 20, FlxG.width, "Created by Chaotic Neutral Games");
			cngames.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(cngames);
		}
		
	}

}