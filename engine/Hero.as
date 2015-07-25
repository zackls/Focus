package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Hero extends MovieClip
	{
		public function Hero()
		{
			this.x = 300;
			this.y = 200;
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			addEventListener(Event.ENTER_FRAME,walk);
		}
		private function walk(e:Event)
		{
			var walkHero:Boolean = Global.vars.walkHero;
			if (walkHero)
			{
				Key.initialize(stage);
				var topKey:int = Global.vars.topKey;
				var bottomKey:int = Global.vars.bottomKey;
				var leftKey:int = Global.vars.leftKey;
				var rightKey:int = Global.vars.rightKey;
				var city:Sprite = Global.vars.city;
				var obstaclesC:Sprite = Global.vars.obstaclesC;
				var pointOffset:Number;
				if (this.width > this.height)
				{
					pointOffset = this.width;
				}
				else if (this.width <= this.height)
				{
					pointOffset = this.height;
				}
				var speedMod:Number = (Global.vars.adrenaline / 140) + (Global.vars.energy / 600) + (Global.vars.health / 400) + 0.25;
				var leftPoint1:Point = new Point(this.x - (pointOffset / 2) + 1,this.y + (pointOffset / 2) - Math.sqrt(speedMod + 10));
				var leftPoint2:Point = new Point(this.x - (pointOffset / 2) + 1,this.y - (pointOffset / 2) + Math.sqrt(speedMod + 10));
				var rightPoint1:Point = new Point(this.x + (pointOffset / 2) - 1,this.y + (pointOffset / 2) - Math.sqrt(speedMod + 10));
				var rightPoint2:Point = new Point(this.x + (pointOffset / 2) - 1,this.y - (pointOffset / 2) + Math.sqrt(speedMod + 10));
				var topPoint1:Point = new Point(this.x + (pointOffset / 2) - Math.sqrt(speedMod + 10),this.y - (pointOffset / 2) + 1);
				var topPoint2:Point = new Point(this.x - (pointOffset / 2) + Math.sqrt(speedMod + 10),this.y - (pointOffset / 2) + 1);
				var bottomPoint1:Point = new Point(this.x + (pointOffset / 2) - Math.sqrt(speedMod + 10),this.y + (pointOffset / 2) - 1);
				var bottomPoint2:Point = new Point(this.x - (pointOffset / 2) + Math.sqrt(speedMod + 10),this.y + (pointOffset / 2) - 1);
				var leftRightRotation:Number;
				if (this.rotation >= -90 && this.rotation < 180)
				{
					leftRightRotation = this.rotation - 90;
				}
				else if (this.rotation >= -180 && this.rotation < -90)
				{
					leftRightRotation = this.rotation + 270;
				}
				if (Key.isDown(topKey) && collisionDetection(topPoint1,topPoint2))
				{
					Global.vars.energy -=  2 / 2592000;
					Global.vars.thirst -=  1 / 1000000;
					city.y += speedMod * (0.3 + (Math.abs((Math.abs(this.rotation) - 180) / 180)));
				}
				if (Key.isDown(bottomKey) && collisionDetection(bottomPoint1,bottomPoint2))
				{
					Global.vars.energy -=  2 / 2592000;
					Global.vars.thirst -=  1 / 1000000;
					city.y -= speedMod * (0.3 + (Math.abs(this.rotation / 180)));
				}
				if (Key.isDown(leftKey) && collisionDetection(leftPoint1,leftPoint2))
				{
					Global.vars.energy -=  2 / 2592000;
					Global.vars.thirst -=  1 / 1000000;
					city.x += speedMod * (0.3 + (Math.abs(leftRightRotation / 180)));
				}
				if (Key.isDown(rightKey) && collisionDetection(rightPoint1,rightPoint2))
				{
					Global.vars.energy -=  2 / 2592000;
					Global.vars.thirst -=  1 / 1000000;
					city.x -= speedMod * (0.3 + (Math.abs((Math.abs(leftRightRotation) - 180) / 180)));
				}
				Global.vars.buildingC.x = city.x
				Global.vars.buildingC.y = city.y
			}
			rotate();
		}
		private function collisionDetection(p1:Point, p2:Point):Boolean
		{
			var obstacleArray:Array = Global.vars.obstacleArray;
			for (var i:int = 0; i < obstacleArray.length; i++)
			{
				if (obstacleArray[i].hitTestPoint(p1.x,p1.y) || obstacleArray[i].hitTestPoint(p2.x,p2.y))
				{
					return false;
				}
			}
			return true;
		}
		private function rotate():void
		{
			var xleg:Number = this.x - stage.mouseX;
			var yleg:Number = this.y - stage.mouseY;
			rotation = (Math.atan2(yleg, xleg) * (180 / Math.PI)) - 90;
		}
	}
}