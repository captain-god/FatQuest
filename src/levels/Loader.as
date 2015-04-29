package levels 
{
	import game.objects.Goodie;
	import game.state.ErrorState;
	import levels.leveldata.Level;
	import org.flixel.*;
	
	/**
	 * Loads the levels from their text files and makes use of them.
	 */	
	public class Loader {		
		
		public static const MAP_DATA:int = 0;
		public static const GOODIE_DATA:int = 1;
		//Hi! If you want to add another constant, like in the tutorial on the wiki, do it here!
		
		/**
		 * (crudely) parses a text file and (hopefully) spits out the requested section
		 * @param level - the level you're trying to load
		 * @param dataType - one of the constants at the top of this file: determines which
		 * part of the file to give you
		 * @return the string containing the section of data we want
		 */
		public static function parseFile(level:int, dataType:int):String {
			var fileContents:String = new Level.levelArray[level];
			var results:Array = fileContents.split("~");
			return results[dataType];		
		}
		
		/**
		 * extracts the goodies from the .txt and makes sense of them
		 * @param coordinates - the string gathered from the split in the calling function (the "3,5;..." bit)
		 * @param tileSize - the size of a tile on the map; needed so we can make a "grid" to put the items on.
		 * @return FlxGroup - the group of goodies, ready to be added to the game!
		 */
		public static function getGoodies(level:int, tileSize:int):FlxGroup {
			var goodieGroup:FlxGroup = new FlxGroup();
			var coordCSV:String = parseFile(level, GOODIE_DATA);
			coordCSV = coordCSV.substring(2);
			coordCSV = coordCSV.replace('\n', "");
			coordCSV = coordCSV.replace('\r', "");
			
			var splitCoords:Array = coordCSV.split(";"); 
			var XY:Array;
			
			for each ( var coord:String in splitCoords) {
				XY = coord.split(",");
				if (XY[0] != 0 && XY[1] != 0) {
					goodieGroup.add(new Goodie((parseInt(XY[0]) * tileSize) + 3, (parseInt(XY[1]) * tileSize)+2));
				}
			}
			
			return goodieGroup;
		}
		
		/**
		 * Creates a TileMap from the level data gathered from makeMap()
		 * @param level - the level you're trying to load
		 * @param tileSize - the size of the tiles in the map.
		 * @return builtLevel - a CSV string that represents the level, or a null string if no level is present
		 * (this one can cause some funk, so be careful)
		 */
		public static function getMap(level:int, tileSize:int):FlxTilemap {
			var builtLevel:FlxTilemap = new FlxTilemap();
			builtLevel.loadMap(parseFile(level, MAP_DATA), FlxTilemap.ImgAuto, tileSize, tileSize, FlxTilemap.AUTO);

			return builtLevel;
		}
	}
}