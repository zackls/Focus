package 
{
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import fl.transitions.PixelDissolve;

	public class Action
	{
		private var itemId:Class;
		private var weightArray:Array;
		private var nextEvent:Function;
		private var keepItemUsed:Boolean;
		private var justClick:Boolean;
		private var objectsTypesParentsPositions:Array;
		private var updateMenu:Function;
		private var iconRelease:Function;
		private var hero:Sprite
		public function Action(itemId:Class,updateMenu:Function,weightArray:Array,nextEvent:Function,keepItemUsed:Boolean,justClick:Boolean,iconRelease:Function,hero:Sprite, ...objectsTypesParentsPositions):void
		{
			this.itemId = itemId;
			this.weightArray = weightArray;
			this.nextEvent = nextEvent;
			this.keepItemUsed = keepItemUsed;
			this.justClick = justClick;
			this.objectsTypesParentsPositions = objectsTypesParentsPositions;
			this.updateMenu = updateMenu;
			this.iconRelease = iconRelease;
			this.hero = hero
		}
		public function Act():void
		{
			var overParent:Object;
			var overObject:Object;
			var i:int;
			var listenerArray:Array = [];
			for (i = 0; i < objectsTypesParentsPositions.length; i += 5)
			{
				if (objectsTypesParentsPositions[i + 1] == "Before")
				{
					if (objectsTypesParentsPositions[i + 2] == Global.vars.obstaclesC)
					{
						Global.vars.obstacleArray.push(objectsTypesParentsPositions[i]);
					}
					objectsTypesParentsPositions[i + 2].addChild(objectsTypesParentsPositions[i]);
					objectsTypesParentsPositions[i].x = objectsTypesParentsPositions[i + 3];
					objectsTypesParentsPositions[i].y = objectsTypesParentsPositions[i + 4];
				}
				else if (objectsTypesParentsPositions[i + 1] == "Over")
				{
					overObject = objectsTypesParentsPositions[i];
					if (objectsTypesParentsPositions[i + 2] == Global.vars.obstaclesC)
					{
						Global.vars.obstacleArray.push(overObject);
					}
					overParent = objectsTypesParentsPositions[i + 2];
					overParent.addChild(overObject);
					overObject.x = objectsTypesParentsPositions[i + 3];
					overObject.y = objectsTypesParentsPositions[i + 4];
				}
				else if (objectsTypesParentsPositions[i + 1] == "Function" && objectsTypesParentsPositions[i + 2] == "Before")
				{
					objectsTypesParentsPositions[i]();
				}
			}
			overObject.addEventListener(Event.ENTER_FRAME,checkItems);
			function checkItems(e:Event):void
			{
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					if (Global.vars.menuItems[i] is itemId)
					{
						listenerArray.push(Global.vars.menuItems[i]);
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP,afterEffects,false,1);
					}
				}
			}
			function afterEffects(e:MouseEvent):void
			{
				var itemUsed:Object = e.currentTarget;
				var regBox:Sprite = new Sprite();
				overObject.parent.addChild(regBox);
				regBox.graphics.beginFill(0x000000,0.000001)
				regBox.graphics.drawRect(overObject.x - 15,overObject.y - 15,overObject.width + 30,overObject.height + 30);
				regBox.graphics.endFill()
				if ((itemUsed.hitTestObject(overObject) && hero.hitTestObject(regBox)) || justClick)
				{
					for (i = 0; i < listenerArray.length; i++)
					{
						listenerArray[i].removeEventListener(MouseEvent.MOUSE_UP,afterEffects);
					}
					overObject.removeEventListener(Event.ENTER_FRAME,checkItems);
					overParent.removeChild(overObject);
					if (keepItemUsed)
					{
						Global.vars.menuItems.push(new itemUsed());
					}
					e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, iconRelease);
					for (i = 0; i < objectsTypesParentsPositions.length; i += 5)
					{
						if (objectsTypesParentsPositions[i + 1] == "Function" && objectsTypesParentsPositions[i + 2] == "After")
						{
							objectsTypesParentsPositions[i]();
						}
						else if (objectsTypesParentsPositions[i + 1] == "Before")
						{
							objectsTypesParentsPositions[i + 2].removeChild(objectsTypesParentsPositions[i]);
						}
						else if (objectsTypesParentsPositions[i + 1] == "After")
						{
							if (objectsTypesParentsPositions[i + 2] == Global.vars.obstaclesC)
							{
								Global.vars.obstacleArray.push(objectsTypesParentsPositions[i]);
							}
							objectsTypesParentsPositions[i + 2].addChild(objectsTypesParentsPositions[i]);
							objectsTypesParentsPositions[i].x = objectsTypesParentsPositions[i + 3];
							objectsTypesParentsPositions[i].y = objectsTypesParentsPositions[i + 4];
						}
						else if (objectsTypesParentsPositions[i + 1] == "Recieved")
						{
							weightArray.push(objectsTypesParentsPositions[i + 2]);
							Global.vars.menuItems.push(objectsTypesParentsPositions[i]);
						}
					}
					updateMenu();
					nextEvent();
				}
			}
		}
	}
}