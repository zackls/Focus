package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;

	public class Combination
	{
		public function Combination(firstItem:Class,keepFirstItem:Boolean,secondItem:Class,keepSecondItem:Boolean,itemRecieved:Object,keepItemRecieved:Boolean,updateMenu:Function,iconRelease:Function,... extraFunctions):void
		{
			var listener:Sprite = new Sprite();
			var firstArray:Array = [];
			var secondArray:Array = [];
			listener.addEventListener(Event.ENTER_FRAME,checkItems);
			function checkItems(e:Event):void
			{
				firstArray = [];
				secondArray = [];
				for (var i:int = 0; i < Global.vars.menuItems.length; i++)
				{
					if (Global.vars.menuItems[i] is firstItem)
					{
						firstArray.push(Global.vars.menuItems[i]);
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP,afterEffects,false,1);
					}
					else if (Global.vars.menuItems[i] is secondItem)
					{
						secondArray.push(Global.vars.menuItems[i]);
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP,afterEffects,false,1);
					}
					else
					{
						Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_UP,afterEffects);
					}
				}
			}
			function afterEffects(e:MouseEvent):void
			{
				if (e.currentTarget is firstItem)
				{
					firstArray.push(e.currentTarget);
				}
				if (e.currentTarget is secondItem)
				{
					secondArray.push(e.currentTarget);
				}
				if (testCollision() && (e.currentTarget is firstItem || e.currentTarget is secondItem))
				{
					if (!(e.currentTarget is firstItem) && !keepFirstItem)
					{
						Global.vars.menuItems[Global.vars.menuItems.lastIndexOf(firstArray[0])] = new pixel();
					}
					else if (!(e.currentTarget is secondItem) && !keepSecondItem)
					{
						Global.vars.menuItems[Global.vars.menuItems.lastIndexOf(secondArray[0])] = new pixel();
					}
					if (e.currentTarget is firstItem && keepFirstItem)
					{
						Global.vars.menuItems.push(new firstItem());
					}
					else if (e.currentTarget is secondItem && keepSecondItem)
					{
						Global.vars.menuItems.push(new secondItem());
					}
					e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,iconRelease);
					if (keepItemRecieved)
					{
						Global.vars.menuItems.push(itemRecieved);
					}
					if (extraFunctions[0] is Function)
					{
						extraFunctions[0](extraFunctions[1],extraFunctions[2],extraFunctions[3],extraFunctions[4],extraFunctions[5]);
					}
					updateMenu();
				}
				function testCollision():Boolean
				{
					for (var i:int = 0; i < firstArray.length; i++)
					{
						for (var j:int = 0; j < secondArray.length; j++)
						{
							if (firstArray[i].hitTestObject(secondArray[j]))
							{
								return true;
							}
						}
					}
					return false;
				}
			}
		}
	}
}