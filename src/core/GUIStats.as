package core 
{
	import starling.text.TextField;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	import starling.utils.HAlign;
	
	import states.Play;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class GUIStats extends Sprite 
	{
		private var play:Play;
		
		private var back:Image;
		private var cross:Button;
		
		private var decoTF:TextField;
		private var decoCosts:TextField;
		private var entryTF:TextField;
		private var pricesTF:TextField;
		
		private var decoPlus:Button;
		private var entryPlus:Button;
		private var entryMinus:Button;
		private var pricesPlus:Button;
		private var pricesMinus:Button;
		
		public function GUIStats(play:Play) 
		{
			this.play = play;
			addEventListener(Event.ADDED_TO_STAGE , init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			back = new Image(Assets.GUIStatsTex);
			addChild(back);
			
			cross = new Button(Assets.crossUpTex , "" , Assets.crossDownTex);
			cross.x = 670;
			cross.y = 50;
			addChild(cross);
			
			decoTF = new TextField(720, 25, String(play.decoration) , "Terminal", 25, Color.rgb(150, 150, 150));
			decoTF.y = 180;
			decoTF.x = 150;
			
			entryTF = new TextField(720, 25,  String(play.entryPrice) , "Terminal", 25, Color.rgb(150, 150, 150));
			entryTF.y = 270;
			entryTF.x = 150;
			
			pricesTF = new TextField(720, 25,  String(play.prices + " %") , "Terminal", 25, Color.rgb(150, 150, 150));
			pricesTF.y = 355;
			pricesTF.x = 150;
			
			if ( play.decoration < 4)
			{
				decoCosts = new TextField(720, 25,  String("Costs : " + Play.DECO_PRICE[play.decoration]) , "Terminal", 25, Color.rgb(150, 150, 150));
				decoCosts.y = 130;
				decoCosts.x = 220;
				addChild(decoCosts);
			}
			
			addChild(decoTF);
			addChild(entryTF);
			addChild(pricesTF);
			
			if (play.decoration < 4)
			{
				decoPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				decoPlus.x = 560;
				decoPlus.y = 170;
				addChild(decoPlus);
				decoPlus.addEventListener(Event.TRIGGERED, decoPs);
			}
			
			if (play.entryPrice < 50)
			{
				entryPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				entryPlus.x = 560;
				entryPlus.y = 260;
				addChild(entryPlus);
				entryPlus.addEventListener(Event.TRIGGERED , enPlus);
			}
			
			if (play.prices < 150)
			{
				pricesPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				pricesPlus.x = 560;
				pricesPlus.y = 345;
				addChild(pricesPlus);
				pricesPlus.addEventListener(Event.TRIGGERED , pcPlus);
			}
			
			if (play.entryPrice > 0)
			{
				entryMinus = new Button(Assets.minusUpTex , "" , Assets.minusDownTex);
				entryMinus.x = 420;
				entryMinus.y = 260;
				addChild(entryMinus);
				entryMinus.addEventListener(Event.TRIGGERED , enMinus);
			}
			
			if (play.prices > 50)
			{
				pricesMinus = new Button(Assets.minusUpTex , "" , Assets.minusDownTex);
				pricesMinus.x = 420;
				pricesMinus.y = 345;
				addChild(pricesMinus);
				pricesMinus.addEventListener(Event.TRIGGERED , pcMinus);
			}
			
			cross.addEventListener(Event.TRIGGERED , close);
			
		}
		
		private function enPlus(e:Event):void
		{
			play.entryPrice += 5;
			init(e);
		}
		
		private function enMinus(e:Event):void
		{
			play.entryPrice -= 5;
			init(e);
		}
		
		private function pcPlus(e:Event):void
		{
			play.prices += 5;
			init(e);
		}
		
		private function pcMinus(e:Event):void
		{
			play.prices -= 5;
			init(e);
		}
		
		private function decoPs(e:Event):void
		{
			var tmp:int = Play.DECO_PRICE[play.decoration];
			
			if ( play.money > tmp)
			{
				play.money -= tmp;
				play.decoration ++;
				play.infos.update();

				switch(play.decoration)
				{
					case 1: play.background.wallsOk = true; break;
					case 2: play.background.carpet1Ok = true; break;
					case 3: play.background.carpet2Ok = true; break;
					case 4: play.background.chairsOk = true; break;
				}
				play.background.updateBackground();
				init(e);
			}
		}
		
		private function close(e:Event):void
		{
			cross.removeEventListener(Event.TRIGGERED , close);
			cross.removeFromParent(true);
			cross = null;
			back.removeFromParent(true);
			back = null;
			
			removeChild(decoTF, true);
			removeChild(entryTF, true);
			removeChild(pricesTF, true);
			
			play.guiOn = false;
			this.removeFromParent();
		}
	}

}