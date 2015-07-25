package 
{
	import flash.display.*;
	import flash.geom.Point;
	import flash.display.Stage;
	import flash.events.Event;

	public class Zombie extends Sprite
	{
		private var Stop:Boolean = false
		public function Zombie(model:Class,target:Sprite,obstacleArray:Array,container:Sprite,containerParent:Sprite)
		{
			var child:Sprite = new model();
			addChild(child);
			var path1:Sprite = new pixel();
			var path2:Sprite = new pixel();
			var path3:Sprite = new pixel();
			var path4:Sprite = new pixel();
			var path5:Sprite = new pixel();
			var path6:Sprite = new pixel();
			var pointOffset:Number = child.width;
			child.rotation = Math.random() * 360;
			var possiblePath1:Sprite = new pixel();
			var possiblePath2:Sprite = new pixel();
			var possiblePath3:Sprite = new pixel();
			child.addChild(possiblePath1);
			child.addChild(possiblePath2);
			child.addChild(possiblePath3);
			var provoke:Boolean = false;
			var failSafe:int = 0
			var randomNumber:Number = Math.random() * 100;
			var timer:int = 0;
			var deathTimer:int = 0;
			var attackTimer = 0;
			var targetPoint:Point = new Point();
			defineNewPoint();
			trackPaths();
			child.addEventListener(Event.ENTER_FRAME,constantEvents);
			child.addEventListener(Event.ENTER_FRAME,checkDeath);
			function constantEvents(e:Event)
			{
				if (!Stop)
				{
					checkProximity();
					if (provoke)
					{
						provoked();
					}
					else if (! provoke)
					{
						unprovoked();
					}
				}
			}
			function checkDeath(e:Event):void
			{
				deathTimer++;
				var xleg:Number = (child.x / 2) + x + container.x + containerParent.x - target.x;
				var yleg:Number = (child.y / 2) + y + container.y + containerParent.y - target.y;
				var hypot:Number = Math.sqrt(((xleg * xleg) + (yleg * yleg)));
				if (deathTimer >= 54000 && hypot > 800)
				{
					die()
				}
			}
			function die():void
			{
				while (this.numChildren > 0)
				{
					this.removeChildAt(0)
				}
			}
			function unprovoked():void
			{
				if (trackPaths())
				{
					if (rotate())
					{
						if (position())
						{
							if (wait())
							{
								randomNumber = Math.random() * 100;
								defineNewPoint();
							}
						}
					}
				}
				else if (! trackPaths())
				{
					while (! trackPaths())
					{
						defineNewPoint();
					}
				}
				function rotate():Boolean
				{
					var xleg:Number = child.x - targetPoint.x;
					var yleg:Number = child.y - targetPoint.y;
					var degrees:Number = Math.atan2(yleg,xleg) * (180 / Math.PI) - 90;
					while (degrees > 180)
					{
						degrees -=  180;
					}
					while (degrees < -180)
					{
						degrees +=  360;
					}
					if (degrees >= child.rotation - 3 && degrees <= child.rotation + 3)
					{
						return true;
					}
					else
					{
						if (degrees >= 0)
						{
							child.rotation -=  0.5 + Math.random() / 4;
						}
						if (degrees < 0)
						{
							child.rotation +=  0.5 + Math.random() / 4;
						}
						return false;
					}
				}
				function position():Boolean
				{
					var xleg:Number = child.x - targetPoint.x;
					var yleg:Number = child.y - targetPoint.y;
					var hypot:Number = Math.sqrt((xleg * xleg) + (yleg * yleg));
					if (hypot <= 5)
					{
						return true;
					}
					else
					{
						if (Math.floor(Math.random() * 4) == 1)
						{
							child.x -=  xleg / hypot / 3;
							child.y -=  yleg / hypot / 3;
						}
						else if (Math.floor(Math.random() * 2) == 0)
						{
							child.x -=  xleg / hypot / 3 * 2;
							child.y -=  yleg / hypot / 3 * 2;
						}
						return false;
					}
				}
				function wait():Boolean
				{
					timer++;
					if (timer >= (randomNumber + 100) / 2)
					{
						timer = 0;
						return true;
					}
					else
					{
						return false;
					}
				}
			}
			function provoked():void
			{
				var attention:Number = Global.vars.attention;
				var leftPoint1:Point = new Point((child.x / 2) - (pointOffset / 2) + x + container.x + containerParent.x,(child.y / 2) + (pointOffset / 2) - 3 + y + container.y + containerParent.y);
				var leftPoint2:Point = new Point((child.x / 2) - (pointOffset / 2) + x + container.x + containerParent.x,(child.y / 2) - (pointOffset / 2) + 3 + y + container.y + containerParent.y);
				var rightPoint1:Point = new Point((child.x / 2) + (pointOffset / 2) + x + container.x + containerParent.x,(child.y / 2) + (pointOffset / 2) - 3 + y + container.y + containerParent.y);
				var rightPoint2:Point = new Point((child.x / 2) + (pointOffset / 2) + x + container.x + containerParent.x,(child.y / 2) - (pointOffset / 2) + 3 + y + container.y + containerParent.y);
				var topPoint1:Point = new Point((child.x / 2) + (pointOffset / 2) - 3 + x + container.x + containerParent.x,(child.y / 2) - (pointOffset / 2) + y + container.y + containerParent.y);
				var topPoint2:Point = new Point((child.x / 2) - (pointOffset / 2) + 3 + x + container.x + containerParent.x,(child.y / 2) - (pointOffset / 2) + y + container.y + containerParent.y);
				var bottomPoint1:Point = new Point((child.x / 2) + (pointOffset / 2) - 3 + x + container.x + containerParent.x,(child.y / 2) + (pointOffset / 2) + y + container.y + containerParent.y);
				var bottomPoint2:Point = new Point((child.x / 2) - (pointOffset / 2) + 3 + x + container.x + containerParent.x,(child.y / 2) + (pointOffset / 2) + y + container.y + containerParent.y);
				var xleg:Number = (child.x / 2) + x + container.x + containerParent.x - target.x;
				var yleg:Number = (child.y / 2) + y + container.y + containerParent.y - target.y;
				var hypot:Number = Math.sqrt(((xleg * xleg) + (yleg * yleg)));
				if (attackTimer >= 30)
				{
					attackTimer = 0;
				}
				attackHero(hypot);
				attackTimer++;
				var degrees:Number = Math.atan2(yleg,xleg) * (180 / Math.PI) - 90;
				while (degrees > 180)
				{
					degrees -=  180;
				}
				while (degrees < -180)
				{
					degrees +=  360;
				}
				child.rotation = degrees;
				if (collisionDetection(leftPoint1, leftPoint2) && xleg >= 0 && hypot > 3)
				{
					child.x -=  (xleg / hypot) * (attention / 80);
				}
				if (collisionDetection(rightPoint1, rightPoint2) && xleg < 0 && hypot > 3)
				{
					child.x -=  (xleg / hypot) * (attention / 80);
				}
				if (collisionDetection(topPoint1, topPoint2) && yleg >= 0 && hypot > 3)
				{
					child.y -=  (yleg / hypot) * (attention / 80);
				}
				if (collisionDetection(bottomPoint1, bottomPoint2) && yleg < 0 && hypot > 3)
				{
					child.y -=  (yleg / hypot) * (attention / 80);
				}
				function collisionDetection(p1:Point, p2:Point):Boolean
				{
					for (var i:int = 0; i < obstacleArray.length; i++)
					{
						if (obstacleArray[i].hitTestPoint(p1.x,p1.y) || obstacleArray[i].hitTestPoint(p2.x,p2.y))
						{
							return false;
						}
					}
					return true;
				}
			}
			function attackHero(hypot:Number):void
			{
				if (hypot < 40 && attackTimer == 0)
				{
					Global.vars.health -=  15;
					if (Math.random() < 0.05)
					{
						stage.removeEventListener(Event.ENTER_FRAME,Global.vars.constantEvents);
						stage.addEventListener(Event.ENTER_FRAME,Global.vars.becomingInfected);
					}
				}
			}
			function trackPaths():Boolean
			{
				possiblePath1.alpha = 0;
				possiblePath2.alpha = 0;
				possiblePath3.alpha = 0;
				var xleg:Number = child.x - targetPoint.x;
				var yleg:Number = child.y - targetPoint.y;
				var hypot:Number = Math.sqrt(((xleg * xleg) + (yleg * yleg)));
				possiblePath1.height = hypot;
				possiblePath2.height = hypot;
				possiblePath3.height = hypot;
				possiblePath1.x = pointOffset / 2;
				possiblePath2.x = pointOffset / -2;
				possiblePath3.y = pointOffset / -2;
				if (testCollision(possiblePath1,possiblePath2,possiblePath3))
				{
					return false;
				}
				else
				{
					return true;
				}
				function testCollision(path1,path2,path3):Boolean
				{
					for (var i:int = 0; i < obstacleArray.length; i++)
					{
						failSafe++;
						if (failSafe > 10000)
						{
							die()
						}
						if (obstacleArray[i].hitTestObject(path1) || obstacleArray[i].hitTestObject(path2) || obstacleArray[i].hitTestObject(path3))
						{
							failSafe = 0
							return true;
						}
					}
					return false;
				}
			}
			function defineNewPoint():void
			{
				randomNumber = Math.random() * 100;
				targetPoint = new Point((((randomNumber + 200) * Math.cos(Math.random() * 360 / (180 / Math.PI))) + child.x),(randomNumber + 200) * Math.sin(Math.random() * 360 / (180 / Math.PI)) + child.y);
			}
			function checkProximity():void
			{
				var attention:Number = Global.vars.attention;
				var xleg:Number = (child.x / 2) + x + container.x + containerParent.x - target.x;
				var yleg:Number = (child.y / 2) + y + container.y + containerParent.y - target.y;
				var hypot:Number = Math.sqrt(((xleg * xleg) + (yleg * yleg)));
				if (! provoke && hypot < (attention + 5) * 10)
				{
					provoke = true;
				}
				else if (provoke && hypot > (attention + 5) * 15)
				{
					defineNewPoint();
					provoke = false;
				}
			}
		}
		public function stopMoving():void
		{
			Stop = true
		}
		public function startMoving():void
		{
			Stop = false
		}
	}
}