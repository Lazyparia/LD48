package core 
{
	import objects.Undead;
	import starling.display.Sprite;
	import states.Play;
	
	/**
	 * ...
	 * @author LazyParia
	 */
	public class ClientHandler 
	{
		private var play:Play;
		private var lifespan:Array = new Array();
		private var entering:Array = new Array();
		private var objectifY:Array = new Array();
		private var objectifX:Array = new Array();
		private var moveX:Array = new Array();
		private var moveY:Array = new Array();
		public var money:Array = new Array();
		
		public function ClientHandler(play:Play) 
		{
			this.play = play;
		}
		
		public function popClient():void
		{
			var tmp:int;
			tmp = play.clients.push(new Undead(Play.CLIENT , 0));
			play.addChild( play.clients[tmp - 1] );
			play.clients[tmp - 1].x = 620;
			play.clients[tmp - 1].y = 100;
			
			play.money += play.entryPrice;
			lifespan[tmp - 1] = 60 * Math.floor(15 + play.decoration - (Math.random()*play.entryPrice));
			entering[tmp - 1] = 60 * 5;
			moveX[tmp - 1] = 0;
			moveY[tmp - 1] = 0;
			
			money[tmp - 1] = 3 + Math.floor(Math.random() * (play.djStat + play.barStat + play.bounStat + play.decoration + 1) );
			
			objectifY [tmp - 1] = Math.floor( Math.random() * (400 - 265 + 1) ) + 200;
			objectifX [tmp - 1] = Math.floor( Math.random() * (425 - 70 + 1) ) + 70;
		}
		
		public function updateClients():void
		{
			for (var i:int = 0 ; i < play.clients.length ; i++)
			{
				if (moveX[i] < 0)
				{
					moveX[i] ++;
					play.clients[i].x++;
				}
				
				if (moveX[i] > 0)
				{
					moveX[i] --;
					play.clients[i].x--;
				}
				
				if (moveY[i] > 0)
				{
					moveY[i] --;
					play.clients[i].y--;
				}
				
				if (moveY[i] < 0)
				{
					moveY[i] ++;
					play.clients[i].y++;
				}
				
				if (entering[i] == 0)
				{
					lifespan[i]--;
					
					if (lifespan[i] <= 0)
						destroy(i);
					
					if (lifespan[i] % 60 == 0)
					{
						switch(Math.floor(Math.random() * 5 ))
						{
							case 0: // Walk Around
								
								if(Math.random() < 0.50)
									moveX[i] = Math.floor(Math.random() * 50);
								else
									moveX[i] = - Math.floor(Math.random() * 70);
									
								if(Math.random() < 0.50)
									moveY[i] = Math.floor(Math.random() * 50);
								else
									moveY[i] = - Math.floor(Math.random() * 50);
							break;
							case 1: // Stand
								play.clients[i].changeState(Play.CLIENT_SO);
							break;
							case 2: // Drink
								play.clients[i].changeState(Play.SPE2);
							break;
							case 3: // Dance
								play.clients[i].changeState(Play.SPE1);
							break;
						}
					}
				}
				else
				{
					entering[i] --;

					if(objectifY[i] > play.clients[i].y)
						play.clients[i].y ++;
					else
						play.clients[i].y --;
						
					if(play.clients[i].x != objectifX[i])
						play.clients[i].x --;

				}
			}
		}
		
		private function destroy(id:int):void
		{
			play.clients[id].removeFromParent();
			play.clients.splice(id , 1);
			lifespan.splice(id , 1);
			entering.splice(id , 1);
			objectifY.splice(id , 1);
			objectifX.splice(id , 1);
			moveX.splice(id , 1);
			moveY.splice(id , 1);
			money.splice(id, 1);
		}
		
	}

}