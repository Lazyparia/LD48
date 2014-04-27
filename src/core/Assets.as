package core 
{
	/**
	 * ...
	 * @author LazyParia
	 * Holly Molly what a mess ... did i do that ? XD
	 */
	
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.text.TextField;
	
	public class Assets 
	{
		[Embed(source = "../../assets/intro.png")]
		private static const menuBg:Class; 			
		public static var menuBgTexture:Texture;
		 
		[Embed(source = "../../assets/play_bg.png")] // Get the png
		private static const playBg:Class; 			 // Private class 
		public static var playBgTexture:Texture;    // Variable to create the texture
		
		[Embed(source = "../../assets/GUI_Stats.png")]
		private static const GUI_Stats:Class; 			
		public static var GUIStatsTex:Texture;
		
		[Embed(source = "../../assets/GUI_Staff.png")]
		private static const GUI_Staff:Class; 			
		public static var GUIStaffTex:Texture;
		
		[Embed(source = "../../assets/barman.png")] 
		private static const barmanTileset:Class; 			 
		public static var barman:TextureAtlas;  
		
		[Embed(source = "../../assets/barman.xml" , mimeType="application/octet-stream")]
		private static const barmanXML:Class;
		
		[Embed(source = "../../assets/bouncer.png")] 
		private static const bouncerTileset:Class; 			 
		public static var bouncer:TextureAtlas;  
		
		[Embed(source = "../../assets/bouncer.xml" , mimeType="application/octet-stream")]
		private static const bouncerXML:Class;
		
		[Embed(source = "../../assets/client.png")] 
		private static const clientTileset:Class; 			 
		public static var client:TextureAtlas;  
		
		[Embed(source = "../../assets/client.xml" , mimeType="application/octet-stream")]
		private static const clientXML:Class;
		
		[Embed(source = "../../assets/djTroll.png")] 
		private static const djTileset:Class; 			 
		public static var dj:TextureAtlas;  
		
		[Embed(source = "../../assets/dj.xml" , mimeType="application/octet-stream")]
		private static const djXML:Class;
		
		[Embed(source="../../assets/terminal.fnt", mimeType="application/octet-stream")]
		private static const terminalXml:Class;
		 
		[Embed(source = "../../assets/terminal_0.png")]
		private static const terminalTex:Class;
		
		[Embed(source = "../../assets/bar.png")]
		private static const bar:Class; 			
		public static var barTex:Texture;
		
		[Embed(source = "../../assets/carpet1.png")]
		private static const car1:Class; 			
		public static var carpet1Tex:Texture;
		
		[Embed(source = "../../assets/carpet2.png")]
		private static const car2:Class; 			
		public static var carpet2Tex:Texture;
		
		[Embed(source = "../../assets/wallsDeco.png")]
		private static const wallD:Class; 			
		public static var wallDecoTex:Texture;
		
		[Embed(source = "../../assets/chairs.png")]
		private static const chairs:Class; 			
		public static var chairsTex:Texture;
		
		[Embed(source = "../../assets/noDj.png")]
		private static const noDj:Class; 			
		public static var noDjTex:Texture;
		
		[Embed(source = "../../assets/djTable.png")]
		private static const djTable:Class; 			
		public static var djTableTex:Texture;
		
		[Embed(source = "../../assets/client_icon.png")]
		private static const clientIC:Class; 			
		public static var clIconTex:Texture;
		
		[Embed(source = "../../assets/money_icon.png")]
		private static const money:Class; 			
		public static var monIconTex:Texture;
		
		[Embed(source = "../../assets/stats_up.png")]
		private static const statsUp:Class; 			
		public static var statsUpTex:Texture;
		
		[Embed(source = "../../assets/stats_down.png")]
		private static const statsDown:Class; 			
		public static var statsDownTex:Texture;
		
		[Embed(source = "../../assets/staff_up.png")]
		private static const staffUp:Class; 			
		public static var staffUpTex:Texture;
		
		[Embed(source = "../../assets/staff_down.png")]
		private static const staffDown:Class; 			
		public static var staffDownTex:Texture;
		
		[Embed(source = "../../assets/crossDown.png")]
		private static const crossDown:Class; 			
		public static var crossDownTex:Texture;
		
		[Embed(source = "../../assets/plusDown.png")]
		private static const plusDown:Class; 			
		public static var plusDownTex:Texture;
		
		[Embed(source = "../../assets/minusDown.png")]
		private static const minusDown:Class; 			
		public static var minusDownTex:Texture;
		
		[Embed(source = "../../assets/crossUp.png")]
		private static const crossUp:Class; 			
		public static var crossUpTex:Texture;
		
		[Embed(source = "../../assets/plusUp.png")]
		private static const plusUp:Class; 			
		public static var plusUpTex:Texture;
		
		[Embed(source = "../../assets/minusUp.png")]
		private static const minusUp:Class; 			
		public static var minusUpTex:Texture;
		
		
		[Embed(source = "../../assets/A philistine world.mp3")]
		private static var music:Class;
		public static var playMusic:Sound;
		
		
		public static function init():void
		{
			playBgTexture = Texture.fromBitmap(new playBg()); // creation of the textures
			menuBgTexture = Texture.fromBitmap(new menuBg()); 
			GUIStatsTex = Texture.fromBitmap(new GUI_Stats()); 
			GUIStaffTex = Texture.fromBitmap(new GUI_Staff()); 
			barTex = Texture.fromBitmap(new bar());
			djTableTex = Texture.fromBitmap(new djTable());
			noDjTex = Texture.fromBitmap(new noDj());
			clIconTex = Texture.fromBitmap(new clientIC());
			monIconTex = Texture.fromBitmap(new money());
			
			chairsTex   = Texture.fromBitmap(new chairs());
			carpet1Tex  = Texture.fromBitmap(new car1());
			carpet2Tex  = Texture.fromBitmap(new car2());
			wallDecoTex = Texture.fromBitmap(new wallD());
			
			staffUpTex  = Texture.fromBitmap(new staffUp());
			staffDownTex = Texture.fromBitmap(new staffDown());
			statsUpTex  = Texture.fromBitmap(new statsUp());
			statsDownTex = Texture.fromBitmap(new statsDown());
			
			minusDownTex = Texture.fromBitmap(new minusDown());
			minusUpTex   = Texture.fromBitmap(new minusUp());
			plusDownTex  = Texture.fromBitmap(new plusDown());
			plusUpTex    = Texture.fromBitmap(new plusUp());
			crossUpTex   = Texture.fromBitmap(new crossUp());
			crossDownTex = Texture.fromBitmap(new crossDown());
			
			barman = new TextureAtlas(Texture.fromBitmap(new barmanTileset()) ,	
												XML(new barmanXML()));
												
			bouncer = new TextureAtlas(Texture.fromBitmap(new bouncerTileset()) ,	
												XML(new bouncerXML()));
												
			client = new TextureAtlas(Texture.fromBitmap(new clientTileset()) ,	
												XML(new clientXML()));
												
			dj = new TextureAtlas(Texture.fromBitmap(new djTileset()) ,	
												XML(new djXML()));
			
			
			var tex:Texture = Texture.fromBitmap(new terminalTex());
			var xml:XML = XML(new terminalXml());
			TextField.registerBitmapFont(new BitmapFont( tex , xml));
			
			playMusic = new music();

		}
		
		
	}

}