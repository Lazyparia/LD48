package objects 
{
	import core.GUILog;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.text.TextField;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	import starling.utils.HAlign;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class Log extends Sprite 
	{
		public var field:TextField;
		private var timer:Timer = new Timer(5);
		public var id:int;
		private var gui:GUILog;
		private var i:int = 0;
		private var slider:uint = 150;
		
		public function Log(str:String , id:int , parent:GUILog) 
		{
			gui = parent;
			this.id = id;
			field = new TextField(500, 25, str , "Terminal", 25, Color.rgb(150, 150, 150));
			field.y = 470;
			field.x = 5;
			field.hAlign = HAlign.LEFT;
			
			addChild(field);
			
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
			timer.addEventListener(TimerEvent.TIMER, time);
			timer.start();
		}
		
		private function time(te:TimerEvent):void
		{
			i += 5;
			
			if (i > 1000)
			{
				slider --;
				field.color = Color.rgb(slider, slider, slider);
			}
			if(i >= 1500)
			{
				timer.removeEventListener(TimerEvent.TIMER , time);
			
				timer = null;
				gui.destroyLog(id);
			}
		}
		
	}

}