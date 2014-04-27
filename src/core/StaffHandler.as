package core 
{
	import states.Play;
	import objects.Undead;
	/**
	 * ...
	 * @author LazyParia
	 */
	public class StaffHandler 
	{
		private var play:Play;
		private var posBar1:Boolean = false;
		private var posBar2:Boolean = false;
		
		private var countBar:int = 0;
		private var countBou:int = 0;
		
		private var moving1:int = 0;
		private var moving2:int = 0;
		
		public function StaffHandler(play:Play) 
		{
			this.play = play;
		}
		
		public function handleBarmen():void
		{
			if (countBar == 0)
			{
				switch(Math.round(Math.random() * 3))
				{
					case 0:
						play.barman1.changeState(Play.STILL);
					break;
					
					case 1:
						move(1);
					break;
					
					case 2:
						play.barman1.changeState(Play.SPE1);
					break;
					
					case 3:
						play.barman1.changeState(Play.SPE2);
					break;
				}
				
				if (play.isBarm2)
				{
					switch(Math.round(Math.random() * 3))
					{
						case 0:
							play.barman2.changeState(Play.STILL);
						break;
						
						case 1:
							move(2);
						break;
						
						case 2:
							play.barman2.changeState(Play.SPE1);
						break;
						
						case 3:
							play.barman2.changeState(Play.SPE2);
						break;
					}
				}
				
			}
			
			if (moving1 < 0)
			{
				moving1 ++;
				play.barman1.x ++;
			}
			if (moving1 > 0)
			{
				moving1 --;
				play.barman1.x --;
			}
			if (moving2 < 0)
			{
				moving2 ++;
				play.barman2.x ++;
			}
			if (moving2 > 0)
			{
				moving2 --;
				play.barman2.x --;
			}
			
			countBar++;
			if (countBar == 60)
				countBar = 0;
		}
		
		private function move(witch:int):void
		{
			if (witch == 1)
			{
				if (posBar1)
				{
					play.barman1.changeState(Play.WALK);
					moving1 = -25;
					posBar1 = !posBar1;
				}
				else
				{
					play.barman1.changeState(Play.WALK);
					moving1 = +25;
					posBar1 = !posBar1;
				}
				
			}
			else if (witch == 2 && play.isBarm2)
			{
				if (posBar2)
				{
					play.barman2.changeState(Play.WALK);
					moving2 = +25;
					posBar2 = !posBar2;
				}
				else
				{
					play.barman2.changeState(Play.WALK);
					moving2 = -25;
					posBar2 = !posBar2;
				}
			}
		}
		
		public function handleBouncers():void
		{
			if (countBou == 0)
			{
				switch (Math.round(Math.random() * 2))
				{
					case 0:
						play.bounc1.changeState(Play.STILL);
					break;
					
					case 1:
						play.bounc1.changeState(Play.SPE1);
					break;
					
					case 2:
						play.bounc1.changeState(Play.SPE2);
					break;
				}
				
				if (play.isBoun2)
				{
					switch (Math.round(Math.random() * 2))
					{
						case 0:
							play.bounc2.changeState(Play.STILL);
						break;
						
						case 1:
							play.bounc2.changeState(Play.SPE1);
						break;
						
						case 2:
							play.bounc2.changeState(Play.SPE2);
						break;
					}
				}
			}
			countBou ++;
			if (countBou == 80)
				countBou = 0
		}
		
	}

}