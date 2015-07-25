package 
{
	import flash.display.Sprite;
	import flash.events.Event

	public class Explosion extends Sprite
	{
		public function Explosion(target:Sprite,prnt:Sprite,baseDamage:Number,xpos:Number,ypos:Number)
		{
			var time:int = 0
			var cloud:Sprite = new explosionCloud()
			var debrisArray:Array = []
			var velocityArray:Array = []
			var slopeArray:Array = []
			var rotationSpeedArray:Array = []
			this.addChild(cloud)
			for (var i:int = 0; i < this.scaleX * 100; i++)
			{
				var debris:Sprite
				if (Math.random() > 0.3)
				{
					debris = new debris4()
				}
				else if (Math.random() > 0.3)
				{
					debris = new debris2()
				}
				else if (Math.random() > 0.3)
				{
					debris = new debris3()
				}
				else
				{
					debris = new debris1()
				}
				velocityArray.push(((Math.round(Math.random()) - 0.5) * 2) * (30 + (Math.random() * 40)))
				slopeArray.push(Math.tan(Math.random() * (2 * Math.PI)))
				rotationSpeedArray.push(10 + (Math.random() * 90))
				debrisArray.push(debris)
				this.addChild(debris)
			}
			var xleg:Number = xpos + prnt.x - target.x - (prnt.width / 2)
			var yleg:Number = ypos + prnt.y - target.y - (prnt.height / 2)
			var hypot:Number = Math.sqrt((xleg * xleg) + (yleg * yleg))
			Global.vars.health -= (baseDamage * baseDamage / ((hypot * hypot) / baseDamage)) / Math.sqrt(baseDamage)
			addEventListener(Event.ENTER_FRAME,constantDebrisStuff)
			function constantDebrisStuff(e:Event):void
			{
				time++
				for (var i:int = 0; i < debrisArray.length; i++)
				{
					debrisArray[i].y += velocityArray[i] * slopeArray[i]
					debrisArray[i].x += velocityArray[i] / slopeArray[i]
					debrisArray[i].rotation += rotationSpeedArray[i]
				}
				cloud.scaleX = -0.5 + Math.pow(1.015, time)
				cloud.scaleY = -0.5 + Math.pow(1.015, time)
				cloud.alpha = 1.31 * Math.pow(0.945,time)
				if (time >= 40)
				{
					while(this.numChildren > 0)
					{
						this.removeChildAt(0)
					}
				}
			}
		}
	}
}