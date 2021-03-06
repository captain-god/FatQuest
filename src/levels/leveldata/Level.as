package levels.leveldata 
{
	/**
	 * The data class that holds all the static references of our level text files.
	 * There are a planned 20 levels in total.
	 */
	public class Level {
		
		/**
		 * last level you can get to in the game
		 */
		public static const LAST_LEVEL:int = 10;
		/**
		 * See the wiki for a template level and information/instructions on how to set up a level file
		 */
		public static var SECRET_LEVEL:Class;
		[Embed(source = "level_1.txt", mimeType = "application/octet-stream")] public static var LEVEL_1:Class;
		[Embed(source = "level_2.txt", mimeType = "application/octet-stream")] public static var LEVEL_2:Class;
		[Embed(source = "level_3.txt", mimeType = "application/octet-stream")] public static var LEVEL_3:Class;
		[Embed(source = "level_4.txt", mimeType = "application/octet-stream")] public static var LEVEL_4:Class;
		[Embed(source = "level_5.txt", mimeType = "application/octet-stream")] public static var LEVEL_5:Class;
		[Embed(source = "level_6.txt", mimeType = "application/octet-stream")] public static var LEVEL_6:Class;
		[Embed(source = "level_7.txt", mimeType = "application/octet-stream")] public static var LEVEL_7:Class;
		[Embed(source = "level_8.txt", mimeType = "application/octet-stream")] public static var LEVEL_8:Class;
		[Embed(source = "level_9.txt", mimeType = "application/octet-stream")] public static var LEVEL_9:Class;
		[Embed(source = "level_10.txt", mimeType = "application/octet-stream")] public static var LEVEL_10:Class;
		
		/**
		 * levelArray is the array holding all the levels in it for quick access ;) 
		 * index 0 is the secret level: shhhhhh!
		 */
		public static var levelArray:Array = new Array(SECRET_LEVEL, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4,
		LEVEL_5, LEVEL_6, LEVEL_7, LEVEL_8, LEVEL_9, LEVEL_10
		);
		 
		/**
		 * The array contains all respective level codes, index 0 being the secret level and index
		 * 1 being level 1 (which is blank, because why would you enter a level code to go to level 1?)
		 * 
		 * The game is called "FatQuest", so I included food in all the level codes. Yanno, for continuity.
		 */
		public static var levelCode:Array = new Array( 
		"secret-tuna", "", "bacon-lazer", "flying-watermelon", "bouncing-beet", "punch-taco", "lmao-nayse",
		"mustard-nun", "salami-desk", "boogaloo-donut", "finally-taco", "crispy-celery", "swimming-bread", 
		"seeding-strawberry", "noodle-kaboodle", "microwave-fish", "moose-cheese", "sexy-grapes", "icy-jam",
		"berry-blizzard", "apache-jello"
		);
	}

}