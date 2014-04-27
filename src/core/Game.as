package core 
{
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import states.Menu;
	import states.Play;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public final class Game extends Sprite 
	{
		//State const
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		
		private var currentState:IState;
		
		public var finalScore:int = 0;
		
		public function Game() 
		{
			Assets.init(); // Load the assets
			addEventListener(Event.ADDED_TO_STAGE , init );
		}
		
		public function changeState(state:int):void
		{
			if (currentState != null)
			{
				currentState.destroy();
				currentState = null;
			}
			
			switch(state)
			{
				case MENU_STATE:
					currentState = new Menu(this);
				break;
				
				case PLAY_STATE:
					currentState = new Play(this);
				break;
				
				default: throw new Error("The state " + state + " does not exist");
			}
			
			addChild(Sprite(currentState));
		}
		
		private function init():void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init );
			
			changeState(MENU_STATE);
			
			addEventListener(Event.ENTER_FRAME , update );
		}
		
		private function update():void
		{
			currentState.update();
		}
		
	}

}