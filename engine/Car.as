package 
{
	import flash.display.*;
	import flash.filters.ColorMatrixFilter;
	public class Car extends Sprite
	{

		public function Car(search:Array, searchItems:Array)
		{
			var randomNumber:Number = Math.random() * 100;
			var car:Sprite;
			if (randomNumber < 37)
			{
				car = new whiteCar();
			}
			else if (randomNumber < 54 && randomNumber >= 37)
			{
				car = new blackCar();
			}
			else if (randomNumber < 67 && randomNumber >= 54)
			{
				car = new blueCar();
			}
			else if (randomNumber < 79 && randomNumber >= 67)
			{
				car = new greyCar();
			}
			else if (randomNumber < 90 && randomNumber >= 79)
			{
				car = new redCar();
			}
			else if (randomNumber < 95 && randomNumber >= 90)
			{
				car = new greenCar();
			}
			else if (randomNumber <= 100 && randomNumber >= 95)
			{
				car = new yellowCar();
			}
			addChild(car);
			var matrix:Array = new Array();
			var brightness:Number = 0.8 + (Math.random() / 2.5);
			matrix = matrix.concat([brightness,0,0,0,0]);// red
			matrix = matrix.concat([0,brightness,0,0,0]);// green
			matrix = matrix.concat([0,0,brightness,0,0]);// blue
			matrix = matrix.concat([0,0,0,1,0]);// alpha
			car.filters = new Array(new ColorMatrixFilter(matrix));
			var itemArray:Array = new Array();
			if (Math.random() > 0.95)
			{
				itemArray.push(new waterBottleFullIcon());
				if (Math.random() > 0.6)
				{
					itemArray.push(new waterBottleFullIcon());
				}
			}
			if (Math.random() > 0.7)
			{
				itemArray.push(new waterBottleEmptyIcon());
				if (Math.random() > 0.2)
				{
					itemArray.push(new waterBottleEmptyIcon());
					if (Math.random() > 0.2)
					{
						itemArray.push(new waterBottleEmptyIcon());
					}
				}
			}
			if (Math.random() > 0.98)
			{
				//upgradeBackpack
			}
			if (Math.random() > 0.9)
			{
				//food
				if (Math.random() > 0.8)
				{
					//food
					if (Math.random() > 0.7)
					{
						//food
						if (Math.random() > 0.6)
						{
							//food
						}
					}
				}
			}
			if (Math.random() > 0.95)
			{
				//pistolAmmo
			}
			if (Math.random() > 0.95)
			{
				//shotgunAmmo
			}
			search.push(car);
			searchItems.push(itemArray);
		}
	}
}