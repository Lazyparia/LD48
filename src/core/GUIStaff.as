package core 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	
	import states.Play;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class GUIStaff extends Sprite 
	{
		
		private var play:Play;
		
		private var back:Image;
		private var cross:Button;
		
		private var barStatTF:TextField;
		private var bounStatTF:TextField;
		private var djStatTF:TextField;
		
		private var barCost:TextField;
		private var bounCost:TextField;
		private var djCost:TextField;
		
		private var barPlus:Button;
		private var bounPlus:Button;
		private var djPlus:Button;
		
		private var barMinus:Button;
		private var bounMinus:Button;
		private var djMinus:Button;
		
		public function GUIStaff(play:Play) 
		{
			this.play = play;
			addEventListener(Event.ADDED_TO_STAGE , init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE , init);
			back = new Image(Assets.GUIStaffTex);
			addChild(back);
			
			cross = new Button(Assets.crossUpTex , "" , Assets.crossDownTex);
			cross.x = 670;
			cross.y = 50;
			addChild(cross);
			
			cross.addEventListener(Event.TRIGGERED , close);
			
			barStatTF = new TextField(720, 25, String(play.barStat) , "Terminal", 25, Color.rgb(150, 150, 150));
			barStatTF.y = 180;
			barStatTF.x = 150;
			
			bounStatTF = new TextField(720, 25,  String(play.bounStat) , "Terminal", 25, Color.rgb(150, 150, 150));
			bounStatTF.y = 270;
			bounStatTF.x = 150;
			
			djStatTF = new TextField(720, 25,  String(play.djStat) , "Terminal", 25, Color.rgb(150, 150, 150));
			djStatTF.y = 355;
			djStatTF.x = 150;
			
			addChild(barStatTF);
			addChild(bounStatTF);
			addChild(djStatTF);
			
			if (play.barStat < 5)
			{
				barPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				barPlus.x = 560;
				barPlus.y = 170;
				addChild(barPlus);
				barPlus.addEventListener(Event.TRIGGERED , plusBar);
				
				barCost = new TextField(720, 25,  String("Costs : " + Play.BAR_PRICE[play.barStat]) , "Terminal", 25, Color.rgb(150, 150, 150));
				barCost.y = 130;
				barCost.x = 220;
				addChild(barCost);
			}
			
			if (play.bounStat < 5)
			{
				bounPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				bounPlus.x = 560;
				bounPlus.y = 260;
				addChild(bounPlus);
				bounPlus.addEventListener(Event.TRIGGERED , plusBoun);
				
				bounCost = new TextField(720, 25,  String("Costs : " + Play.BOUN_PRICE[play.bounStat]) , "Terminal", 25, Color.rgb(150, 150, 150));
				bounCost.y = 230;
				bounCost.x = 220;
				addChild(bounCost);
			}
			
			if (play.djStat < 4)
			{
				djPlus = new Button(Assets.plusUpTex , "" , Assets.plusDownTex);
				djPlus.x = 560;
				djPlus.y = 345;
				addChild(djPlus);
				djPlus.addEventListener(Event.TRIGGERED , plusDj);
				
				djCost = new TextField(720, 25,  String("Costs : " + Play.DJ_PRICE[play.djStat]) , "Terminal", 25, Color.rgb(150, 150, 150));
				djCost.y = 310;
				djCost.x = 220;
				addChild(djCost);
			}
			
			if (play.barStat > 0)
			{
				barMinus = new Button(Assets.minusUpTex , "" , Assets.minusDownTex);
				barMinus.x = 420;
				barMinus.y = 170;
				addChild(barMinus);
				barMinus.addEventListener(Event.TRIGGERED , minusBar);
			}
			
			if (play.bounStat > 0)
			{
				bounMinus = new Button(Assets.minusUpTex , "" , Assets.minusDownTex);
				bounMinus.x = 420;
				bounMinus.y = 260;
				addChild(bounMinus);
				bounMinus.addEventListener(Event.TRIGGERED , minusBoun);
			}
			
			if (play.djStat > 0)
			{
				djMinus = new Button(Assets.minusUpTex , "" , Assets.minusDownTex);
				djMinus.x = 420;
				djMinus.y = 345;
				addChild(djMinus);
				djMinus.addEventListener(Event.TRIGGERED , minusDj);
			}
			
		}
		
		private function minusBar(e:Event):void
		{
			if (play.barStat == 1)
					play.fBar = true;
					
			play.salary -= 25;
			play.barStat --;
			play.infos.update();
			init(e);
		}
		private function minusBoun(e:Event):void
		{
			if (play.bounStat == 1)
					play.fBoun = true;
			play.salary -= 25;
			play.bounStat--;
			play.infos.update();
			init(e);
		}
		private function minusDj(e:Event):void
		{
			play.salary -= 25;
			play.djStat--;
			play.infos.update();
			play.dj.lvlDown();
			init(e);
		}
		
		private function plusBar(e:Event):void
		{
			var tmp:int = Play.BAR_PRICE[play.barStat];
			
			if (play.money > tmp )
			{
				play.money -= tmp;
				
				if(play.barStat == 0)
					play.hBar = true;
					
				play.salary += 25;
				play.barStat ++;
				play.infos.update();
				init(e);
			}
		}
		
		private function plusBoun(e:Event):void
		{
			var tmp:int = Play.BOUN_PRICE[play.bounStat];
			
			if (play.money > tmp )
			{
				play.money -= tmp;
				
				if (play.bounStat == 0)
					play.hBoun = true;
				
				play.salary += 25;
				play.bounStat ++;
				play.infos.update();
				init(e);
			}
		}
		
		private function plusDj(e:Event):void
		{
			var tmp:int = Play.DJ_PRICE[play.djStat];
			
			if (play.money > tmp )
			{
				play.money -= tmp;
				play.djStat ++;
				
				play.salary += 25;
				play.infos.update();
				play.dj.lvlUp();
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
			
			removeChild(barStatTF);
			removeChild(bounStatTF);
			removeChild(djStatTF);
			
			play.guiOn = false;
			this.removeFromParent();
		}
		
	}

}