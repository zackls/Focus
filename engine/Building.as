package
{
	import flash.display.*
	import flash.events.*
	
	public class Building extends Sprite
	{
		private var model:Sprite
		private var hero:Sprite
		private var doorReg:Sprite
		private var doorType:String
		private var floorsDoors:Array
		private var obstaclesStored:Sprite
		private var keyPressed:Boolean
		private var container:Sprite
		public function Building(model:Sprite,hero:Sprite,doorReg:Sprite,doorType:String,... floorsDoors) 
		{
			this.obstaclesStored = Global.vars.obstaclesC
			this.model = model
			this.hero = hero
			this.doorReg = doorReg
			this.doorType = doorType
			this.floorsDoors = floorsDoors
			addEventListener(Event.ENTER_FRAME,checkItems)
			function checkItems(e:Event):void
			{
				if (hero.hitTestObject(doorReg))
				{
					//enter text
					if (keyPressed == true && !Key.isDown(32))
					{
						enterBuilding()
						removeEventListener(Event.ENTER_FRAME,checkItems)
					}
				}
				if (Key.isDown(32))
				{
					keyPressed = true
				}
				else
				{
					keyPressed = false
				}
			}
		}
		public function enterBuilding():void
		{
			if (doorType == "up")
			{
				Global.vars.city.y += doorReg.height * 2.5
			}
			else if (doorType == "down")
			{
				Global.vars.city.y -= doorReg.height * 2.5
			}
			else if (doorType == "right")
			{
				Global.vars.city.x -= doorReg.width * 2.5
			}
			else if (doorType == "left")
			{
				Global.vars.city.x += doorReg.width * 2.5
			}
			container = new Sprite()
			Global.vars.buildingC.addChild(container)
			container.x = model.x
			container.y = model.y
			var buildingObstacles:Array = []
			for (var i:int = 0; i < floorsDoors.length;)
			{
				if (floorsDoors[i + 1] == "Bounds")
				{
					for (var j:int = 0; j < floorsDoors[i + 2].length; j += 4)
					{
						var boundary:Sprite = new Sprite()
						buildingObstacles.push(boundary)
						container.addChild(boundary)
						boundary.graphics.beginFill(0x000000,1)
						boundary.graphics.drawRect(floorsDoors[i + 2][j],floorsDoors[i + 2][j + 1],floorsDoors[i + 2][j + 2],floorsDoors[i + 2][j + 3])
						boundary.graphics.endFill()
					}
				}
				if (floorsDoors[i + 1] == "Floor")
				{
					
				}
				i += floorsDoors[i]
			}
			for (i = 0; i < Global.vars.city.numChildren; i++)
			{
				Global.vars.city.getChildAt(i).alpha = 0
			}
			for (i = 0; i < Global.vars.infectedC.numChildren; i++)
			{
				if (Global.vars.infectedC.getChildAt(i).stopMoving is Function)
				{
					Global.vars.infectedC.getChildAt(i).stopMoving()
				}
			}
			addEventListener(Event.ENTER_FRAME,constantEvents)
			function constantEvents(e:Event):void
			{
				Global.vars.obstacleArray = buildingObstacles
				if (hero.hitTestObject(doorReg))
				{
					//exit text
					if (keyPressed == true && !Key.isDown(32))
					{
						exitBuilding()
						removeEventListener(Event.ENTER_FRAME,constantEvents)
					}
				}
				if (Key.isDown(32))
				{
					keyPressed = true
				}
				else
				{
					keyPressed = false
				}
			}
		}
		public function exitBuilding():void
		{
			if (doorType == "up")
			{
				Global.vars.city.y -= doorReg.height * 2.5
			}
			else if (doorType == "down")
			{
				Global.vars.city.y += doorReg.height * 2.5
			}
			else if (doorType == "right")
			{
				Global.vars.city.x += doorReg.width * 2.5
			}
			else if (doorType == "left")
			{
				Global.vars.city.x -= doorReg.width * 2.5
			}
			for (i = 0; i < Global.vars.city.numChildren; i++)
			{
				Global.vars.city.getChildAt(i).alpha = 1
			}
			Global.vars.obstaclesC = obstaclesStored
			Global.vars.buildingC.removeChild(container)
			container = null
			for (var i:int = 0; i < Global.vars.infectedC.numChildren; i++)
			{
				if (Global.vars.infectedC.getChildAt(i).startMoving is Function)
				{
					Global.vars.infectedC.getChildAt(i).startMoving()
				}
			}
			addEventListener(Event.ENTER_FRAME,constantEvents)
			function constantEvents(e:Event):void
			{
				if (hero.hitTestObject(doorReg))
				{
					//enter text
					if (keyPressed == true && !Key.isDown(32))
					{
						enterBuilding()
						removeEventListener(Event.ENTER_FRAME,constantEvents)
					}
				}
				if (Key.isDown(32))
				{
					keyPressed = true
				}
				else
				{
					keyPressed = false
				}
			}
		}
	}
}
