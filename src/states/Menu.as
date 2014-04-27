package states 
{
	import core.Game;
	import core.Assets;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel
	import flash.media.SoundLoaderContext

	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class Menu extends Sprite implements IState 
	{		
		private var game:Game;
		private var background:Image;
		private var timer:Timer = new Timer(1000);
		
		private var startOk:Boolean = false;
		private var textField:TextField;
		private var txtVisible:Boolean = true;
		private var wait:int = 30; // wait/60 of a second
		
		private var music:Sound;
        private var channel:SoundChannel;
		
		public function Menu(game:Game) 
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE , init);
			
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			
			
			
			background = new Image(Assets.menuBgTexture);
			addChild(background);
			
			textField = new TextField(720, 500, "Click anywhere to start ! ", "Terminal", 25, Color.rgb(150,150,150));
			textField.hAlign = HAlign.CENTER;  // horizontal alignment
			textField.vAlign = VAlign.CENTER; // vertical alignment
			textField.y = 150;
			
			timer.addEventListener(TimerEvent.TIMER , onTime);
			
			//
			//game.changeState(Game.PLAY_STATE);
			//
			
		}
		
		
        private function playMusic():void
        {
			channel = music.play();
			channel.soundTransform = new SoundTransform (0.45);
			
            channel.addEventListener(flash.events.Event.SOUND_COMPLETE, loopMusic);
        }
		
        private function loopMusic(e:flash.events.Event):void
        {
            if (channel != null)
            {
                channel.removeEventListener(flash.events.Event.SOUND_COMPLETE, loopMusic);

                playMusic();
            }
        }
		
		private function onTime(ts:TimerEvent):void
		{
			txtVisible = !txtVisible;
			
			if (txtVisible)
				addChild(textField);
			else
				removeChild(textField);
		}	
		
		private function onTouch(te:TouchEvent):void
		{
			var touch:Touch = te.getTouch(stage);
			
			if(touch && touch.phase == TouchPhase.ENDED)
				game.changeState(Game.PLAY_STATE);
		}
		
		
		/* INTERFACE IState */
		
		public function update():void 
		{
			if (!startOk)
			{
				if ( wait > 0 )
					wait --;
				else if (background.y > -500)
					background.y -= 2;
				else
				{
					startOk = true;
					addChild(textField);
					timer.start();
					addEventListener(TouchEvent.TOUCH , onTouch);
				}
			}
		}
		
		public function destroy():void 
		{
			removeEventListener(TouchEvent.TOUCH , onTouch);
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER , onTime);
			timer = null;
			
			background.removeFromParent(true);
			background = null;
			
			textField.removeFromParent(true);
			textField = null;
			
			this.removeFromParent(true);
		}
		
	}

}