package objects 
{
	import core.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author LazyParia
	 */
	public class Background extends Sprite
	{
		private var background:Image;
		private var walls:Image;
		private var carpet1:Image;
		private var carpet2:Image;
		private var chairs:Image;
		
		public var wallsOk:Boolean = false;
		public var chairsOk:Boolean = false;
		public var carpet1Ok:Boolean = false;
		public var carpet2Ok:Boolean = false;
	
		public function Background() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			background = new Image(Assets.playBgTexture);
			addChild(background);
			
			walls = new Image(Assets.wallDecoTex);
			chairs = new Image(Assets.chairsTex);
			carpet1 = new Image(Assets.carpet1Tex);
			carpet2 = new Image(Assets.carpet2Tex);
		}
		
		public function updateBackground():void
		{
			if (wallsOk)
				addChild(walls);
				
			if (chairsOk)
				addChild(chairs);
			
			if (carpet1Ok)
				addChild(carpet1);
				
			if (carpet2Ok)
				addChild(carpet2);

		}
		
		public function destroy():void
		{
			background.removeFromParent(true);
			background = null;
			
			if (wallsOk)
				walls.removeFromParent(true);
				
			if (chairsOk)
				chairs.removeFromParent(true);
				
			walls = null;
			chairs = null;
			
			this.removeFromParent(true);
		}
		
	}

}