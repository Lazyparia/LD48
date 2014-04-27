package core 
{
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import states.Play;
	
	import starling.utils.Color;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class GUIInfos extends Sprite
	{
		private var play:Play;
		
		private var cliTxtField:TextField;
		private var clIcon:Image;
		
		private var monTxtField:TextField;
		private var monIcon:Image;
		
		private var dayTF:TextField;
		private var salaryTF:TextField;
		
		public function GUIInfos(play:Play) 
		{
			this.play = play;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			clIcon = new Image(Assets.clIconTex);
			addChild(clIcon);
			clIcon.y = 8;
			clIcon.x = 555;

			monIcon = new Image(Assets.monIconTex);
			addChild(monIcon);
			monIcon.y = 8;
			monIcon.x = 615;
			
			monTxtField = new TextField(720, 25, String(play.money), "Terminal", 25, Color.rgb(150, 150, 150));
			monTxtField.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(monTxtField);
			monTxtField.x = 630;
			
			cliTxtField = new TextField(720, 25, String(play.clients.length), "Terminal", 25, Color.rgb(150, 150, 150));
			cliTxtField.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(cliTxtField);
			cliTxtField.x = 570;
			
			dayTF = new TextField(720, 25, String("d :" + play.day), "Terminal", 25, Color.rgb(150, 150, 150));
			dayTF.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(dayTF);
			dayTF.x = 5;
			
			salaryTF = new TextField(720, 25, String("Salary :" + play.salary), "Terminal", 25, Color.rgb(150, 150, 150));
			salaryTF.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(salaryTF);
			salaryTF.x = 70;
		}
		
		public function update():void
		{
			monTxtField.removeFromParent();
			cliTxtField.removeFromParent();
			dayTF.removeFromParent();
			salaryTF.removeFromParent();
			
			monTxtField = new TextField(720, 25, String(play.money), "Terminal", 25, Color.rgb(150, 150, 150));
			monTxtField.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(monTxtField);
			monTxtField.x = 630;
			
			cliTxtField = new TextField(720, 25, String(play.clients.length), "Terminal", 25, Color.rgb(150, 150, 150));
			cliTxtField.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(cliTxtField);
			cliTxtField.x = 570;
			
			dayTF = new TextField(720, 25, String("d :" + play.day), "Terminal", 25, Color.rgb(150, 150, 150));
			dayTF.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(dayTF);
			dayTF.x = 5;
			
			salaryTF = new TextField(720, 25, String("Salary :" + play.salary), "Terminal", 25, Color.rgb(150, 150, 150));
			salaryTF.autoSize=TextFieldAutoSize.HORIZONTAL;
			addChild(salaryTF);
			salaryTF.x = 70;
		}
		
		public function destroy():void
		{
			
		}
		
	}

}