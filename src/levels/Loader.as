package levels 
{
	import game.objects.Goodie;
	import game.state.ErrorState;
	import levels.leveldata.Level;
	import org.flixel.*;
	
	public class Loader {		
		
		/* Reads the level data from the appropriate level txt file, then splits off the goodie data
		 * and only keeps the map data
		 * @param level - the level number to load
		 * @return - a CSV string that represents the level
		 */
		private static function makeMap(level:int = 0):String {
			var fileContents:String;
			var results:Array;
			
			switch (level) {
				case 1:
					fileContents = new Level.LEVEL_1();
					results = fileContents.split("~");
					return results[0];
					break;
				case 2:
					fileContents = new Level.LEVEL_2();
					results = fileContents.split("~");
					return results[0];
					break;
				case 3:
					fileContents = new Level.LEVEL_3();
					results = fileContents.split("~");
					return results[0];
					break;
				case 4:
					fileContents = new Level.LEVEL_4();
					results = fileContents.split("~");
					return results[0];
					break;
				default:
					return null;
			}
		}
		
		/* extracts the goodies from the .txt and makes the text into something usable
		 * @param coordinates - the string gathered from the split in the calling function (the "3,5;..." bit)
		 * @param tileSize - the size of a tile on the map; needed so we can make a "grid" to put the items on.
		 * @return FlxGroup - the group of goodies, ready to be added to the game!
		 */
		public static function extractGoodies(coordCSV:String, tileSize:int):FlxGroup {
			var goodieGroup:FlxGroup = new FlxGroup();
			coordCSV = coordCSV.substring(2);
			coordCSV = coordCSV.replace('\n', "");
			coordCSV = coordCSV.replace('\r', "");
			var splitCoords:Array = coordCSV.split(";"); 
			var XY:Array;
			
			for each ( var coord:String in splitCoords) {
				XY = coord.split(",");
				goodieGroup.add(new Goodie(parseInt(XY[0]) * tileSize, parseInt(XY[1]) * tileSize));
			}
			
			return goodieGroup;
		}
		
		/* Places all the goodies for a level within a map
		 * @param level - the level number
		 * @return goodieGroup:FlxGroup - the group of all the goodies placed
		 */
		public static function getGoodies(level:int, tileSize:int):FlxGroup {
			var fileContents:String;
			var results:Array;
			
			switch (level) {
				case 1:
					fileContents = new Level.LEVEL_1();
					results = fileContents.split("~");
					return extractGoodies(results[1], tileSize);
					break;
				case 2:
					fileContents = new Level.LEVEL_2();
					results = fileContents.split("~");
					return extractGoodies(results[1], tileSize);
					break;
				case 3:
					fileContents = new Level.LEVEL_3();
					results = fileContents.split("~");
					return extractGoodies(results[1], tileSize);
					break;
				case 4:
					fileContents = new Level.LEVEL_4();
					results = fileContents.split("~");
					return extractGoodies(results[1], tileSize);
					break;
				default:
					return null;
			}
		}
		
		/* Reads the level data from the appropriate level file
		 * @param level - the level number to load
		 * @return - a CSV string that represents the level
		 */
		public static function getMap(level:int, tileSize:int):FlxTilemap {
			var madeMap:String = makeMap(level);
			if (madeMap != null) {
				var builtLevel:FlxTilemap = new FlxTilemap();
				builtLevel.loadMap(makeMap(level), FlxTilemap.ImgAuto, tileSize, tileSize, FlxTilemap.AUTO);

				return builtLevel;
			}
			else return null;
		}
	}
}