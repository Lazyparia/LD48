package core 
{
	import core.Assets;
	import objects.Log;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.Event;


	/**
	 * ...
	 * @author LazyParia
	 */
	public class GUILog extends Sprite 
	{
		
		private var logs:Array;

		public function GUILog() 
		{
			addEventListener(Event.ADDED_TO_STAGE , init);
			
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			logs = new Array();
		}
		
		public function pushLog(log:String):void
		{
			logs.push(new Log(log , logs.length , this));
			addChild(logs[logs.length-1]);
			
			for (var i:int = 0 ; i < logs.length-1 ; i++)
				logs[i].field.y -= 25;
		}
		
		public function destroyLog(id:int):void
		{
			removeChild(logs[id]);
			logs.splice(id , 1);
			for (var i:int ; i < logs.length ; i++)
			{
				logs[i].id = i;
			}
		}
		
	}

}