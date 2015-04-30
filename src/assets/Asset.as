package assets 
{
	/**
	 * embeds all the assets used in the game in one class for easy access
	 * Usage: when referencing an asset, type "new Asset.name();"
	 * for example,
	 * var playerPNG:FlxSprite = new Asset.playerPNG();
	 */
	public class Asset {
		//image
		[Embed(source = "img/player.png")] public static var playerPNG:Class;
		[Embed(source = "img/cn_logo.png")] public static var CNLogoPNG:Class;
		//sound effect
		[Embed(source = "sound/sfx/plip_1.mp3")] public static var plip_1MP3:Class;
		[Embed(source = "sound/sfx/plip_2.mp3")] public static var plip_2MP3:Class;
		[Embed(source = "sound/sfx/woop_1.mp3")] public static var woop_1MP3:Class;
		[Embed(source = "sound/sfx/lose.mp3")] public static var loseMP3:Class;
		//music
		[Embed(source = "sound/music/fatquest.mp3")] public static var themesongMP3:Class;
		[Embed(source = "sound/music/fatquest_level.mp3")] public static var levelMP3:Class;
		[Embed(source = "sound/music/fatquest_victory.mp3")] public static var victoryMP3:Class;
	}
}