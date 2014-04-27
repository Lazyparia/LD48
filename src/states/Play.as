package states 
{
	import core.*;
	import objects.*;
	import starling.display.Button;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.events.Event;
	
	import flash.media.SoundChannel;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	import core.ClientHandler;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class Play extends Sprite implements IState 
	{
		// #### CONSTS ####
		public static const STILL:uint     =	0;
		public static const WALK:uint      =  	1; // bouncer and dj does not
		public static const SPE1:uint      = 	2; // client: dance , bouncer: taunt , barman: shake , dj: animate
		public static const SPE2:uint 	   = 	3; // client: drink , bouncer: shake head , barman: <||> , dj: animate 2
		public static const CLIENT_SO:uint =	4;
		public static const CLIENT_SE:uint =	5;
		public static const CLIENT_NE:uint =	6;
		public static const CLIENT_NO:uint =	7;
		
		public static const BARMAN:uint	 =	0;
		public static const BOUNCER:uint = 	1;
		public static const DJ:uint	=		2;
		public static const CLIENT:uint  = 	3;
		
		public static const DECO_PRICE:Array = new Array(200, 450, 1200, 2000);
		
		public static const BAR_PRICE:Array = new Array(200, 450, 1200, 2000, 2500);
		public static const BOUN_PRICE:Array = new Array(200, 450, 1200, 2000, 2500);
		public static const DJ_PRICE:Array = new Array(200,450,1200,2000);
		
		public static const PREFIX:Array = new Array("still" , "walk" , "spe1" , "spe2" , "S-O" , "S-E" , "N-E" , "N-O");
		
		// #### STATS ####
		public var money:int = 250;	
		
		private var safety:int;
		private var coolness:int;
		private var pricyness:int;
		
		public var decoration:uint = 0;
		public var djStat:uint = 0;
		public var barStat:uint = 0;
		public var bounStat:uint = 0;
		
		public var salary:int = 50;
		
		public var entryPrice:int = 10;
		public var prices:int = 100;
		
		// #### DRAWABLE ####
		public var background:Background;
		private var bar:Image;
		
		public var bounc1:Undead;
		public var bounc2:Undead;
		public var isBoun2:Boolean = false;
		
		public var barman1:Undead;
		public var barman2:Undead;
		public var isBarm2:Boolean = false;
		
		private var staffHandl:StaffHandler;
		public var dj:Dj;
		
		private var clientsHandl:ClientHandler;
		public var clients:Array = new Array();
		
		// #### GUIs ####
		public var infos:GUIInfos;
		public var logs:GUILog;
		
		public var stats:GUIStats;
		public var staff:GUIStaff;
		
		public var statsBtn:Button;
		public var staffBtn:Button;
		
		// #### STUFF ####
		
		private var game:Game;
		
		private var music:Sound;
        private var channel:SoundChannel;
		
		public var guiOn:Boolean = false;
		private var tuto:Boolean = false;
		
		public var hBar:Boolean = false;
		public var hBoun:Boolean = false;
		
		public var fBar:Boolean = false;
		public var fBoun:Boolean = false;
		
		public var day:int = 0;
		private var fCount:int = 0;
		
		public function Play(game:Game) 
		{
			this.game = game;
			addEventListener(starling.events.Event.ADDED_TO_STAGE , init);
			
		}
		
		private function init(event:starling.events.Event):void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE , init);
			
			staffHandl = new StaffHandler(this);
			clientsHandl = new ClientHandler(this);
			
			background = new Background();
			addChild(background);
			
			// #### STAFF ####
			
			barman1 = new Undead(BARMAN , 1);
			addChild(barman1);
			barman1.x = 230;
			barman1.y = 100;
						
			bounc1 = new Undead(BOUNCER , 1);
			addChild(bounc1);
			bounc1.changeState(SPE2);
			bounc1.x = 540;
			bounc1.y = 90;
			
			dj = new Dj();
			addChild(dj);
			
			// #### STUFF ####
			
			bar = new Image(Assets.barTex);
			addChild(bar);
			bar.x = 105;
			bar.y = 120;
			
			// ##### GUI ####
			
			infos = new GUIInfos(this);
			addChild(infos);
			
			statsBtn = new Button( Assets.statsUpTex , "" , Assets.statsDownTex );
			statsBtn.addEventListener(Event.TRIGGERED , statsTriggerd);
			addChild(statsBtn);
			statsBtn.y = 450;
			statsBtn.x = 670;
			
			staffBtn = new Button( Assets.staffUpTex , "" , Assets.staffDownTex );
			staffBtn.addEventListener(Event.TRIGGERED , staffTriggerd);
			addChild(staffBtn);
			staffBtn.y = 400;
			staffBtn.x = 670;
			
			logs = new GUILog();
			addChild(logs);
			
			music = Assets.playMusic;
			playMusic();
			
		}
		

		
		private function statsTriggerd(e:Event):void
		{
			stats = new GUIStats(this);
			guiOn = true;
			addChild(stats);
			
		}
		
		private function staffTriggerd(e:Event):void
		{
			staff = new GUIStaff(this);
			guiOn = true;
			addChild(staff);
		}
		
		/* INTERFACE IState */
		
		public function update():void 
		{
				
			if (!tuto)
			{
				if (!guiOn)
				{
					fCount++;
					time();
					
					if (day == 1 && fCount == 1)
					{
						clientsHandl.popClient();
					}
					if (day == 3 && fCount == 1)
					{
						clientsHandl.popClient();
					}
					
					if (day == 20 && fCount == 1)
					{
						clientsHandl.popClient();
					}
					if (day == 25 && fCount == 1)
					{
						clientsHandl.popClient();
					}
					if (day == 10 && fCount == 1)
					{
						clientsHandl.popClient();
					}
					
					if ( Math.random() * (bounStat + barStat + decoration + dj + 1) > 1)
						clientsHandl.popClient();
						
					if ( Math.random() < 0.03 && fCount == 30)
						clientsHandl.popClient();
					
					if (fCount == 1)
					{
						for (var i:int ; i < clients.length ; i++)
							money+=clientsHandl.money[i];
					}

					if(hBar)
					{
						hireBarman();
						hBar = false;
					}
					
					if(hBoun)
					{
						hireBouncer();
						hBoun = false;
					}
					
					if(fBar)
					{
						fireBarman();
						fBar = false;
					}
					
					if(fBoun)
					{
						fireBouncer();
						fBoun = false;
					}
					
					// UPDATE THE HANDLERS
					staffHandl.handleBarmen();
					staffHandl.handleBouncers();
					clientsHandl.updateClients();
					
				}
			}
			else 
			{
				// TUTO
			}
		}
		
		private function playMusic():void
        {
			channel = music.play();
			channel.soundTransform = new SoundTransform (0.25);
			
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
		
		private function time():void
		{
			if(fCount == 100)
			{
				day ++;
				fCount = 0;
				money -= salary / 30;
				infos.update();
			}
			
			if(day == 30)
			{
				day = 0;
				fCount = 0;
				infos.update();
				logs.pushLog("A month have passed");
			}
		}
		
		public function hireBouncer():void
		{
			if (!isBoun2)
			{
				isBoun2 = true;
				bounc2 = new Undead(BOUNCER , 1);
				addChild(bounc2);
				bounc2.x = 50;
				bounc2.y = 130;
				
				logs.pushLog("New bouncer hired");
			}
		}
		
		public function fireBouncer():void
		{
			if (isBoun2)
			{
				isBoun2 = false;
				bounc2.removeFromParent(true);
				bounc2 = null;
				logs.pushLog("Bouncer fired");
			}
		}
		
		public function hireBarman():void
		{
			if (!isBarm2)
			{
				bar.removeFromParent();
				
				if (barman1.x > 205)
					barman1.x = 205;
				isBarm2 = true;
				barman2 = new Undead(BARMAN , 1);
				addChild(barman2);
				barman2.x = 265;
				barman2.y = 100;
				
				logs.pushLog("New barman hired");
				
				addChild(bar);
			}

		}
		
		public function fireBarman():void
		{
			if (isBarm2)
			{
				barman1.x = 230
				isBarm2 = false;
				barman2.removeFromParent(true);
				barman2 = null;
				logs.pushLog("Barman fired");

			}

		}
		
		public function destroy():void 
		{
			background.destroy();
			
			this.removeFromParent(true);
		}
	}
}