package objects 
{
	import core.Assets;
	import states.Play;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	/**
	 * ...
	 * @author LazyParia
	 */
	
	public class Undead extends Sprite 
	{
		private var timer:Timer = new Timer(500);
		private var state:uint;
		private var type:uint;
		
		private var anim:Boolean = false; // frame A / frame B
		private var actual:Image;
		
		public var lvl:int;
		
		private var ft:Boolean = true;
		
		public function Undead (type:uint , level:int) 
		{
			lvl = level;
			this.type = type;
			addEventListener(Event.ADDED_TO_STAGE , init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			
			switch(type)
			{
				case Play.BARMAN :
					actual =  new Image(Assets.barman.getTexture( "stillA" ));
				break;
				
				case Play.BOUNCER :
					actual =  new Image(Assets.bouncer.getTexture( "stillA" ));
				break;
				
				case Play.CLIENT :
						actual =  new Image(Assets.client.getTexture( "S-OA" ));
						state = Play.CLIENT_SO;
				break;
			}
			
			addChild(actual);
			
			timer.addEventListener(TimerEvent.TIMER, onTime);
			timer.start();
		}
		
		private function updateImage():void
		{
			removeChild(actual);
			
			switch(type)
			{
				case Play.BARMAN :
					if (anim)
						actual =  new Image(Assets.barman.getTexture( String(Play.PREFIX[state] + "A") ));
					else
						actual =  new Image(Assets.barman.getTexture( String(Play.PREFIX[state] + "B") ));
				break;
				
				case Play.BOUNCER :
					if (anim)
						actual =  new Image(Assets.bouncer.getTexture( String(Play.PREFIX[state] + "A") ));
					else
						actual =  new Image(Assets.bouncer.getTexture( String(Play.PREFIX[state] + "B") ));
				break;
				
				case Play.CLIENT :
					if (anim)
						actual =  new Image(Assets.client.getTexture( String(Play.PREFIX[state] + "A") ));
					else
						actual =  new Image(Assets.client.getTexture( String(Play.PREFIX[state] + "B") ));
				break;
			}
			
			addChild(actual);
		}
		
		private function onTime(te:TimerEvent):void
		{
			anim = !anim;
			updateImage();
		}
		
		public function changeState(nState:uint):void
		{
			state = nState;
			updateImage();
		}
		
		public function levelUp():void
		{
			if (lvl < 3)
				lvl ++;
		}
		public function destroy():void
		{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTime);
			timer = null;
			
			actual.removeFromParent(true);
			actual = null;
			
			this.removeFromParent(true);
		}
		
	}

}