package core 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	
	 //Options du fichier SWF
	[SWF(width = 720, height = 500, frameRate = 60, backgroundColor = 0x16212a)]
	
	public class PreLoader extends MovieClip 
	{
		private static const PROGRESS_BAR_HEIGHT:Number = 20;
		
		private var star:Object;

		public function PreLoader()
		{
			this.stop();
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderInfo_progressHandler);
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}

		private function loaderInfo_progressHandler(event:ProgressEvent):void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xcccccc);
			this.graphics.drawRect(20, (500 - PROGRESS_BAR_HEIGHT) / 2,
													(this.stage.stageWidth-40) * event.bytesLoaded / event.bytesTotal, PROGRESS_BAR_HEIGHT);
			this.graphics.endFill();
		}

		private function loaderInfo_completeHandler(event:Event):void
		{
			this.graphics.clear();
			this.gotoAndStop(2);

			const StarlingType:Class = getDefinitionByName("starling.core.Starling") as Class;
			const MainType:Class = getDefinitionByName("core.Game") as Class;
			this.star = new StarlingType(MainType, this.stage);
			//this.star.showStats = true; //Affiche FPS et d'autres stats
			this.star.start();
		}
		
	}

}