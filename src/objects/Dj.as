package objects 
{
	import core.Assets;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import states.Play;
	import objects.Undead;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	
	public class Dj extends Sprite 
	{
		private var table:Image;
		
		public var lvl:int = 0;
		
		private var anim:Boolean = false; // frame A / frame B
		private var actual:Image;
		private var timer:Timer = new Timer(500);
		
		public function Dj()
		{
			addEventListener(Event.ADDED_TO_STAGE , init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			
			table = new Image(Assets.djTableTex);
			addChild(table);
			table.x =460;
			table.y = 300;
			
			actual = new Image(Assets.noDjTex);
			addChild(actual);
			actual.x = 590;
			actual.y = 370;
		}
		
		public function lvlUp():void
		{
			if (lvl == 0)
			{
				actual.removeFromParent();
				actual = new Image(Assets.dj.getTexture( "trollA"));
				addChild(actual);
				
				actual.x = 558;
				actual.y = 324;
				timer.addEventListener(TimerEvent.TIMER, onTime);
				timer.start();
			}

			lvl++;
		}
		
		public function lvlDown():void
		{
			if (lvl == 1)
			{
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, onTime);
				
				actual.removeFromParent();
				
				actual = new Image(Assets.noDjTex);
				addChild(actual);
				actual.x = 590;
				actual.y = 370;
			}
			lvl --;
		}
		
		private function onTime(te:TimerEvent):void
		{
			actual.removeFromParent();
			
			anim = !anim;
			
			if (anim)
				actual = new Image(Assets.dj.getTexture( "trollA"));
			else
				actual = new Image(Assets.dj.getTexture( "trollB"));
			
			actual.x = 558;
			actual.y = 324;
			addChild(actual);
		}
		
		public function destroy():void
		{
			timer.removeEventListener(TimerEvent.TIMER, onTime);	
			actual.removeFromParent(true);
			actual = null;
			this.removeFromParent(true);
		}
		
	}

}