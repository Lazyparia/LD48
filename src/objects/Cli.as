package objects 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	import core.Assets;
	import states.Play;
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class Cli extends Sprite 
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
		
		public function Cli() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			
			lifeSpan = 60 * 10;
			actual =  new Image(Assets.client.getTexture( "S-OA" ));
			state = Play.CLIENT_SO;
			addChild(actual);
			
			this.x = 620;
			this.y = 100;
			
			randomPoint();
		}
		
		private function updateImage():void
		{
			removeChild(actual);
			if (anim)
				actual =  new Image(Assets.client.getTexture( String(Play.PREFIX[state] + "A") ));
			else
				actual =  new Image(Assets.client.getTexture( String(Play.PREFIX[state] + "B") ));
			
			addChild(actual);
		}
		
		private function randomPoint():void
		{
			goingX = Math.floor(Math.random() * (MAX_RIGHT - MAX_LEFT + 1) + MAX_LEFT );
			goingY = Math.floor(Math.random() * (MAX_DOWN - MAX_UP + 1) + MAX_UP );
		}
		
		private function goToPoint():void
		{
			if (x < goingX)
			{
				if (y < goingY)
				{
					nextDir = Play.CLIENT_SE
					x+=2;
					y+=2;
				}
				else
				{
					nextDir = Play.CLIENT_NE;
					y+=2;
					x+=2;
				}
			}
			else if (y < goingY)
			{
				nextDir = Play.CLIENT_SO;
				y+=2;
				x+=2;
			}
			else
			{
				nextDir = Play.CLIENT_NO;
				y+=2;
				x+=2;
			}
			
			if (state != nextDir)
				state = nextDir;
		}
		
		public function update():void
		{		
			
			//anim = !anim;
			updateImage();
			
			if (lifeSpan > 0)
				lifeSpan --;
			
			if(!arrived)
			{
				goToPoint();
				if ((x - goingX < 6 || x - goingX > 6) && (y - goingY < 6 || y - goingY > 6))
					arrived = true;
			}
			else
			{
				count ++;
				if (count == 61)
					count = 0;
					
				if (count == 1)
				{
					switch(Math.random() * 4)
					{
						case 1:
							state = Play.SPE1;
						break;
						
						case 2:
							state = Play.SPE2;
						break;
						
						case 3:
							state = Play.CLIENT_SO;
						break;
						
						case 4:
							randomPoint();
							arrived = false;
						break;
					}
				}
			}
	
		}
		
		public function destroy():void
		{
			
			timer = null;
			
			actual.removeFromParent(true);
			actual = null;
			
			this.removeFromParent();
		}
		
	}

}