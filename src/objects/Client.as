package objects 
{
	import core.Assets;
	import states.Play;
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event
	/**
	 * ...
	 * @author LazyParia
	 */
	public class Client extends Sprite
	{
		public static const MAX_UP:int=	160;
		public static const MAX_RIGHT:int=430;
		public static const MAX_DOWN:int=425;
		public static const MAX_LEFT:int =45;
		
		private var timer:Timer = new Timer(500);
		private var state:uint;
		
		private var anim:Boolean = false; // frame A / frame B
		private var actual:Image;
		
		public var lifeSpan:int;
		
		private var count:int = 0;
		private var RP:Boolean = false;
		
		private var goingX:int;
		private var goingY:int;

		private var nextDir:uint;
		private var arrived:Boolean = false;
		
		public function Client() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE , init);
		}
		

		
	}

}