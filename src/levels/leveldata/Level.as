package levels.leveldata 
{
	public class Level {
		//text files should be 53x18
		[Embed(source = "level_1.txt", mimeType = "application/octet-stream")] public static var LEVEL_1:Class;
		[Embed(source = "level_2.txt", mimeType = "application/octet-stream")] public static var LEVEL_2:Class;
		[Embed(source = "level_3.txt", mimeType = "application/octet-stream")] public static var LEVEL_3:Class;
		[Embed(source = "level_4.txt", mimeType = "application/octet-stream")] public static var LEVEL_4:Class;
		
		/* The array contains all respective level codes, index 0 being the secret level
		 * and index 1 being level 1 (which is kinda pointless, if you think about it) 
		 * entering a blank line brings you to level 1*/
		public static var levelCode:Array = new Array( 
		"secret-tuna", "", "bacon-lazer", "flying-watermelon", "bustling-beet", "punch-taco", "ayy-lmao",
		"mustard-nun", "salami-swami", "boogalo-donut", "beef-curry", "crispy-celery", "swimming-bread", 
		"seeding-strawberry", "noodle-kaboodle", "microwave-fish", "moose-cheese", "sexy-grapes", "icy-jam",
		"berry-blizzard", "apache-jello"
		);
	}

}