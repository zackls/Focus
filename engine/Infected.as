package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.display.Stage;
	import flash.events.Event;

	public class Infected
	{
		public static function createInfected(one:Class, two:Class, container:Sprite, containerParent:Sprite, target:Sprite, xpos:Number, ypos:Number, ignoreHypot:Boolean, obstacles:Array):void
		{
			var randomNumber:int = Math.floor(Math.random() * 2);
			var instance:Sprite;
			if (ignoreHypot)
			{
				if (randomNumber == 0)
				{
					instance = new Zombie(one,target,obstacles,container,containerParent);
				}
				else if (randomNumber == 1)
				{
					instance = new Zombie(two,target,obstacles,container,containerParent);
				}
				container.addChild(instance);
				instance.scaleX = 0.4;
				instance.scaleY = 0.4;
				instance.x = xpos;
				instance.y = ypos;
			}
			else if (! ignoreHypot)
			{
				var hypot:Number;
				var angle:Number;
				var xPos:Number;
				var yPos:Number;
				var tester:Sprite = new testCircle();
				defineItems()
				function defineItems():void
				{
					hypot = 700 + (Math.random() * 2300);
					angle = Math.PI * 2 * Math.random()
					xPos = target.x - containerParent.x + (Math.cos(angle) * hypot);
					yPos = target.y - containerParent.y + (Math.sin(angle) * hypot);
					tester = new testCircle();
					tester.x = xPos;
					tester.y = yPos;
					container.addChild(tester);
					addNewZombie()
				}
				function addNewZombie():void
				{
					if (testCollision(tester))
					{
						if (randomNumber == 0)
						{
							instance = new Zombie(one,target,obstacles,container,containerParent);
						}
						else if (randomNumber == 1)
						{
							instance = new Zombie(two,target,obstacles,container,containerParent);
						}
						container.addChild(instance);
						instance.scaleX = 0.4;
						instance.scaleY = 0.4;
						instance.x = xPos;
						instance.y = yPos;
					}
					else
					{
						if (container.contains(tester))
						{
							container.removeChild(tester);
						}
						defineItems()
					}
					if (container.contains(tester))
					{
						container.removeChild(tester);
					}
				}
			}
			function testCollision(clip:Sprite):Boolean
			{
				for (var i:int = 0; i < obstacles.length; i++)
				{
					if (obstacles[i].hitTestObject(clip))
					{
						return false;
					}
				}
				return true;
			}
		}
		public static function checkInfected(frequency:Number, container:Sprite, containerParent:Sprite, target:Sprite, obstacles:Array):void
		{
			var randomNumber:Number = Math.random() * 5400;
			if (frequency >= randomNumber)
			{
				if (randomNumber >= 0 && randomNumber < 0.5)
				{
					createInfected(zombie1, zombie2, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 0.5 && randomNumber < 1)
				{
					createInfected(zombie3, zombie6, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 1 && randomNumber < 1.5)
				{
					createInfected(zombie9, zombie4, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 1.5 && randomNumber < 2)
				{
					createInfected(zombie1, zombie4, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 2 && randomNumber < 3)
				{
					createInfected(zombie7, zombie4, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 3 && randomNumber < 4)
				{
					createInfected(zombie8, zombie9, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 4 && randomNumber < 5)
				{
					createInfected(zombie4, zombie5, container, containerParent, target, 0, 0, false, obstacles);
				}
				else if (randomNumber >= 5)
				{
					createInfected(zombie5, zombie5, container, containerParent, target, 0, 0, false, obstacles);
				}
			}
		}
	}
}