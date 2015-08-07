package 
{
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.*;
	import flash.text.*;
	import flash.utils.*
	import flash.filters.*;
	import fl.video.FLVPlayback;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName

	public class Main extends MovieClip
	{
		public function Main()
		{
			stop();
			menuScreen();
		}
		private function preloader():void
		{
			var clockContainer:Sprite = new Sprite();
			addChild(clockContainer);
			clockContainer.x = 200;
			clockContainer.y = 200;
			var clockBG:Sprite = new watchBG();
			clockContainer.addChild(clockBG);
			var a;
			for (var i:int = 0; i < 60; i++)
			{
				if (i / 5 is int)
				{
					a = new clockMark();
					clockContainer.addChild(a);
					a.y = 120 * Math.sin((i * 6) * (Math.PI / 180));
					a.x = 120 * Math.cos((i * 6) * (Math.PI / 180));
				}
				a = new clockTick();
				clockContainer.addChild(a);
				a.y = 150 * Math.sin((i * 6) * (Math.PI / 180));
				a.x = 150 * Math.cos((i * 6) * (Math.PI / 180));
				a.rotation = (i * 6) + 90;
			}
			var text1:TextField = new TextField();
			textFormatting(text1, "Instead of a \n preloader, you \n get to see how \n long you've \n waited and not \n how close you \n are to finishing.", false, 385.4, 0, 214.6, 300, new TextFormat(), 0xBFA02F, "Calibri", 29, true, true, "right");
			graphics.beginFill(0x000000);
			graphics.drawRect(0,0,600,400);
			graphics.endFill();
			var hourHand:Sprite = new HHand();
			clockContainer.addChild(hourHand);
			var minuteHand:Sprite = new MHand();
			clockContainer.addChild(minuteHand);
			var secondHand:Sprite = new SHand();
			clockContainer.addChild(secondHand);
			var clockTop:Sprite = new watchTop();
			clockContainer.addChild(clockTop);
			var secondsOffset:int = 0;
			var seconds:int = 0;
			var minutes:int = 0;
			var hours:int = 0;
			addEventListener(Event.ENTER_FRAME, preloadFunction);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, update);
			function preloadFunction(e:Event):void
			{
				seconds = (getTimer() / 1000) - (60 * secondsOffset);
				if (seconds >= 60)
				{
					secondsOffset +=  1;
					seconds -=  60;
					minutes +=  1;
				}
				if (minutes >= 60)
				{
					hours +=  1;
					minutes -=  60;
				}
				if (hours >= 12)
				{
					hours -=  12;
				}
				secondHand.rotation = seconds * 6;
				minuteHand.rotation = (minutes * 6) + (seconds / 10);
				hourHand.rotation = (hours * 30) + (minutes / 2);
			}
			function update(e:ProgressEvent):void
			{
				var percent:Number = (e.bytesLoaded * 100) / e.bytesTotal;
				if (percent == 100)
				{
					removeEventListener(Event.ENTER_FRAME, preloader);
					loaderInfo.removeEventListener(ProgressEvent.PROGRESS, update);
					awesomesauce()
				}
			}
		}
		private function awesomesauce():void
		{
			clearEverything();
			var timer:int = 0;
			addEventListener(Event.ENTER_FRAME, constantEvents);
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, 600, 400);
			graphics.endFill();
			var intro:FLVPlayback = new FLVPlayback();
			intro.height = 400;
			intro.width = 600;
			intro.source = "intro.flv";
			addChild(intro);
			function constantEvents(e:Event):void
			{
				timer +=  1;
				if (timer == 115)
				{
					menuScreen();
				}
			}
		}
		private function menuScreen():void
		{
			clearEverything();
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, 600, 400);
			graphics.endFill();
			var blurFilter:BlurFilter = new BlurFilter(0,0,1);
			var glowFilter:GlowFilter = new GlowFilter(0xFFFFFF,0,50,20,10,1,true,false);
			var text1:TextField = new TextField();
			var text2:TextField = new TextField();
			var text3:TextField = new TextField();
			var text4:TextField = new TextField();
			text2.addEventListener(MouseEvent.CLICK, credits);
			text3.addEventListener(MouseEvent.CLICK, intro);
			text4.addEventListener(MouseEvent.CLICK, brief);
			textFormatting(text4, "Brief", false, 270.15, 240.95, 59.7, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "center");
			textFormatting(text3, "Start", false, 269.7, 179.95,60.6, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "center");
			textFormatting(text2, "Credits", false, 257.2, 306, 85.6, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "center");
			textFormatting(text1, "FOCUS", false, 167.85, 0, 264.35, 94, new TextFormat(), 0xBFA02F, "Cambria", 90, true, false, "center");
			var blurTimer:int = 0;
			blurItems(text1, text2, text3, text4, new Object(), blurTimer, glowFilter, blurFilter);
		}
		private function credits(e:MouseEvent):void
		{
			clearEverything();
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, 600, 400);
			graphics.endFill();
			var blurFilter:BlurFilter = new BlurFilter(0,0,1);
			var glowFilter:GlowFilter = new GlowFilter(0xFFFFFF,0,50,20,10,1,true,false);
			var text1:TextField = new TextField();
			var text2:TextField = new TextField();
			var text3:TextField = new TextField();
			var text4:TextField = new TextField();
			var text5:TextField = new TextField();
			text5.addEventListener(MouseEvent.CLICK, returnToMenu);
			textFormatting(text1, "CREDITS", false, 125.05, 0, 349.95, 94, new TextFormat(), 0xBFA02F, "Cambria", 90, true, false, "center");
			textFormatting(text2, "Zack L-S: Coding, Artwork, and Sound", false, 79.1, 159.95, 441.8, 37, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "left");
			textFormatting(text3, "Jonathan H: Sound", false, 188.2, 199.95, 223.65, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "left");
			textFormatting(text4, "Leo L: Artwork", false, 212.65, 239.95, 174.7, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "left");
			textFormatting(text5, "Back", false, 212.65, 319.95, 174.7, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "center");
			var blurTimer:int = 0;
			blurItems(text1, text2, text3, text4, text5, blurTimer, glowFilter, blurFilter);
		}
		private function intro(e:MouseEvent):void
		{
			clearEverything();
			var timer:int = 0;
			var a;
			var i:int;
			var blurFilter1:BlurFilter = new BlurFilter(50,50,1);
			var blurFilter2:BlurFilter = new BlurFilter(10,10,1);
			var city:Sprite = new cityBefore();
			city.x = 300;
			city.y = 168.05;
			city.scaleX = 0.45;
			city.scaleY = 0.45;
			city.alpha = 0;
			var cloudsBG2:Sprite = new clouds();
			cloudsBG2.x = -24.6;
			cloudsBG2.y = 306.75;
			cloudsBG2.rotation = -15;
			cloudsBG2.alpha = 0.7;
			var cloudsBG1:Sprite = new clouds();
			cloudsBG1.x = -64.6;
			cloudsBG1.y = 316.75;
			cloudsBG1.rotation = -15;
			cloudsBG1.alpha = 0.9;
			var cloudsFG:Sprite = new clouds();
			cloudsFG.x = -24.6;
			cloudsFG.y = 306.75;
			cloudsFG.rotation = -15;
			cloudsFG.alpha = 0.2;
			var helicopter:Sprite = new milChopper();
			helicopter.x = 250;
			helicopter.y = 220;
			helicopter.rotation = 75;
			helicopter.scaleX = 0.25;
			helicopter.scaleY = 0.25;
			var blades:Sprite = new milBlades();
			blades.x = 250;
			blades.y = 220;
			blades.scaleX = 0.25;
			blades.scaleY = 0.25;
			var lightning:Sprite = new whiteSquare();
			lightning.alpha = 1;
			var rainContainerBehind:Sprite = new Sprite();
			var rainContainerFront:Sprite = new Sprite();
			var smokeContainer:Sprite = new Sprite();
			addChild(city);
			addChild(cloudsBG2);
			addChild(rainContainerBehind);
			addChild(cloudsBG1);
			addChild(helicopter);
			addChild(blades);
			addChild(smokeContainer);
			addChild(rainContainerFront);
			addChild(cloudsFG);
			addChild(lightning);
			addEventListener(Event.ENTER_FRAME, constantEventsBefore);
			function constantEventsBefore(e:Event):void
			{
				rainFunction(10);
				lightningFunction(2);
				timer++;
				blades.rotation +=  57;
				cloudsBG1.x -=  1.5;
				cloudsBG1.y +=  0.375;
				cloudsFG.x -=  2;
				cloudsFG.y +=  0.5;
				if (timer >= 100)
				{
					timer = 0;
					lightning.alpha = 1;
					removeEventListener(Event.ENTER_FRAME, constantEventsBefore);
					addEventListener(Event.ENTER_FRAME, constantEventsAfter);
				}
			}
			function constantEventsAfter(e:Event):void
			{
				rainContainerBehind.filters = [blurFilter2];
				rainContainerFront.filters = [blurFilter2];
				if (blurFilter1.blurX > 0)
				{
					blurFilter1.blurX -=  0.75;
					blurFilter1.blurY -=  0.75;
					helicopter.filters = [blurFilter1];
					blades.filters = [blurFilter1];
					lightning.filters = [blurFilter1];
					smokeContainer.filters = [blurFilter1];
				}
				else if (blurFilter1.blurX <= 0)
				{
					helicopter.filters = [];
					blades.filters = [];
					lightning.filters = [];
					smokeContainer.filters = [];
				}
				if (timer >= 50 && timer < 150)
				{
					cloudsFG.alpha +=  0.01;
					cloudsBG1.alpha -=  0.01;
					cloudsBG2.alpha +=  0.005;
				}
				else if (timer >= 150 && timer < 350)
				{
					cloudsFG.alpha +=  0.00001;
					cloudsBG2.alpha -=  0.0001;
					cloudsBG1.alpha -=  0.0001;
					city.alpha +=  0.05;
					city.scaleX +=  0.0003;
					city.scaleY +=  0.0003;
				}
				else if (timer == 500)
				{
					startGame();
				}
				rainFunction(12);
				lightningFunction(3);
				smokeFunction();
				timer++;
				helicopter.x +=  0.02;
				helicopter.y -=  0.005;
				blades.x +=  0.02;
				blades.y -=  0.005;
				cloudsBG1.x -=  1.5 - (timer / 200);
				cloudsBG1.y +=  0.375 - (timer / 800);
				cloudsFG.x -=  2 - (timer / 200);
				cloudsFG.y +=  0.5 - (timer / 800);
				helicopter.rotation +=  0.1 + (timer / 200);
				blades.rotation +=  57 - (timer / 200);
			}
			function smokeFunction():void
			{
				a = new smokeImage();
				smokeContainer.addChild(a);
				a.x = helicopter.x;
				a.y = helicopter.y;
				a.alpha = 0.25;
				for (i = 0; i < smokeContainer.numChildren; i++)
				{
					a = smokeContainer.getChildAt(i);
					a.x -=  1.5;
					a.y +=  0.375;
					a.alpha -=  0.01;
					a.scaleX +=  0.03;
					a.scaleY +=  0.03;
					if (a.alpha <= 0)
					{
						smokeContainer.removeChild(a);
					}
				}
			}
			function rainFunction(f:int):void
			{
				for (i = 0; i < f; i++)
				{
					a = new rainDrop();
					var randomRainPos:Number = Math.random() * 100;
					if (randomRainPos > 50)
					{
						rainContainerBehind.addChild(a);
						a.alpha = 0.3;
					}
					else if (randomRainPos <= 50)
					{
						rainContainerFront.addChild(a);
						a.alpha = 0.1;
					}
					a.x = (Math.random() * 600) + 80;
					a.y = (Math.random() * 400) - 20;
					a.rotation = -15;
				}
				for (i = 0; i < rainContainerBehind.numChildren; i++)
				{
					a = rainContainerBehind.getChildAt(i);
					a.x -=  16;
					a.y +=  4;
					if (a.x < -80 || a.y > 420)
					{
						rainContainerBehind.removeChild(a);
					}
				}
				for (i = 0; i < rainContainerFront.numChildren; i++)
				{
					a = rainContainerFront.getChildAt(i);
					a.x -=  16;
					a.y +=  4;
					if (a.x < -80 || a.y > 420)
					{
						rainContainerFront.removeChild(a);
					}
				}
			}
			function lightningFunction(f:Number):void
			{
				var randomNumber:Number = Math.random() * 100;
				if (randomNumber < f)
				{
					lightning.alpha = 1;
				}
				if (lightning.alpha > 0)
				{
					lightning.alpha -=  0.1;
				}
			}
		}
		private function brief(e:MouseEvent):void
		{
			clearEverything();
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, 600, 400);
			graphics.endFill();
			var blurFilter:BlurFilter = new BlurFilter(0,0,1);
			var glowFilter:GlowFilter = new GlowFilter(0xFFFFFF,0,50,20,10,1,true,false);
			var text1:TextField = new TextField();
			var text2:TextField = new TextField();
			var text3:TextField = new TextField();
			text3.addEventListener(MouseEvent.CLICK, returnToMenu);
			textFormatting(text1, "BRIEF", false, 178.05, 0, 243.95, 94, new TextFormat(), 0xBFA02F, "Cambria", 90, true, false, "center");
			textFormatting(text2, "I tried to make this game as realistic as possible. You're a \n downed helicopter pilot in a city that's been quarantined \n for a disease that makes people dillusional, among other \n things. Search for items to survive and escape. Stay away \n from the infected or find out what its like to be infected. \n Get out of the city within 5 days, or find out what \n happens after 5 days.", false, 6.5, 90, 597.75, 283, new TextFormat(), 0xBFA02F, "Calibri", 25, true, false, "center");
			textFormatting(text3, "Back", false, 212.65, 319.95, 174.7, 33, new TextFormat(), 0xBFA02F, "Calibri", 29, true, false, "center");
			var blurTimer:int = 0;
			blurItems(text1, text2, text3, new Object(), new Object(), blurTimer, glowFilter, blurFilter);
		}
		private function returnToMenu(e:MouseEvent):void
		{
			menuScreen();
		}
		private function restartGame(cause:String):void
		{
			trace("Restarted Game");
		}
		private function startGame():void
		{
			stage.quality = "medium"
			Key.initialize(stage);
			clearEverything();
			Global.vars.topKey = 87
			Global.vars.bottomKey = 83
			Global.vars.leftKey = 65
			Global.vars.rightKey = 68
			Global.vars.obstacleArray = [];
			Global.vars.adrenaline = 100;
			Global.vars.health = 30 + (Math.random() * 10) - 5;
			Global.vars.energy = 80 + (Math.random() * 20) - 10;
			Global.vars.thirst = 20 + (Math.random() * 5) - 2.5;
			Global.vars.hunger = 5;
			Global.vars.attention = 50;
			Global.vars.city = new cityMain();
			Global.vars.obstaclesC = new Sprite();
			Global.vars.infectedC = new Sprite();
			Global.vars.buildingC = new Sprite();
			Global.vars.constantEvents = constantEvents;
			Global.vars.becomingInfected = becomingInfected;
			var obstaclesC:Sprite = Global.vars.obstaclesC;
			var infectedC:Sprite = Global.vars.infectedC;
			var infectedArray:Array = Global.vars.infectedArray;
			var menuC:Sprite = new Sprite();
			var overheadC:Sprite = new Sprite();
			var a;
			var j:int;
			var k:int
			var l:int
			var city:Sprite = Global.vars.city;
			var whiteFG:Sprite = new whiteSquare();
			var blackFG:Sprite = new blackSquare();
			var yellowFG1:Sprite = new infectedFG2();
			yellowFG1.alpha = 0;
			yellowFG1.filters = new Array(new BlurFilter(10,10,1));
			var infectedTime:int = 0;
			
			//hero
			var hero:Sprite = new Hero();
			var heroBlood:Sprite;
			if (Math.random() < .33)
			{
				heroBlood = new blood1();
				heroBlood.addChild(new blood2());
				hero.addChild(heroBlood);
			}
			else if (Math.random() < .33)
			{
				heroBlood = new blood2();
				heroBlood.addChild(new blood1());
				hero.addChild(heroBlood);
			}
			else
			{
				heroBlood = new blood3();
				heroBlood.addChild(new blood1());
				hero.addChild(heroBlood);
			}
			heroBlood.alpha = 0
			var hatContainer:Sprite = new Sprite()
			var jacketContainer:Sprite = new Sprite()
			var backpackContainer:Sprite = new Sprite()
			hero.addChild(jacketContainer)
			hero.addChild(backpackContainer)
			hero.addChild(hatContainer)
			heroClothes(helmet, -24.95, -30.95, true, hatContainer);
			heroClothes(jacket, -41.05, -13.05, true, jacketContainer);
			heroClothes(backpack20, -30.9, -12.65, true, backpackContainer);
			function heroClothes(item:Class, xPos:int, yPos:int, display:Boolean, container:Sprite):void
			{
				if (display)
				{
					a = new item();
					container.addChild(a);
					a.x = xPos;
					a.y = yPos;
				}
				else
				{
					for (var i:int = 0; i < container.numChildren; i++)
					{
						if (container.getChildAt(i) is item)
						{
							container.removeChild(container.getChildAt(i))
							break
						}
					}
				}
			}

			//menu
			var iconsLeft:int = 0;
			var iconsRight:int = 0;
			Global.vars.menuItems = new Array(new jacketIcon(),new knifeIcon(),new helmetIcon(),new lighterIcon());
			var itemPounds:Array = new Array(1,0,2,0);
			var scroller:Sprite = new Sprite();
			var LRScroller:Sprite = new Sprite();
			scroller.y = 400;
			var menuTabUp:Sprite = new tabUp();
			var menuTabDown:Sprite = new tabDown();
			var menuTabRight:Sprite = new tabRight();
			var menuTabLeft:Sprite = new tabLeft();
			var menuBG:Sprite = new menuBackground();
			var currentBackpack:Sprite = new backpack20Icon();
			var pistolAmmoCount:Sprite = new bulletIcon()
			var shotgunAmmoCount:Sprite = new shellIcon()
			var pistolAmmoText:TextField = new TextField()
			var shotgunAmmoText:TextField = new TextField()
			var ammoFormat:TextFormat = new TextFormat("Calibri",12,0x000000,false,false,false,null,null,"center")
			pistolAmmoText.defaultTextFormat = ammoFormat;
			pistolAmmoText.width = 30;
			pistolAmmoText.height = 16;
			pistolAmmoText.selectable = false
			pistolAmmoText.x = 535 - 15;
			pistolAmmoText.y = 5
			pistolAmmoText.multiline = false
			shotgunAmmoText.defaultTextFormat = ammoFormat;
			shotgunAmmoText.width = 30;
			shotgunAmmoText.height = 16;
			shotgunAmmoText.selectable = false
			shotgunAmmoText.x = 575 - 15
			shotgunAmmoText.y = 5
			shotgunAmmoText.multiline = false
			pistolAmmoCount.x = 535
			pistolAmmoCount.y = 25
			shotgunAmmoCount.x = 575
			shotgunAmmoCount.y = 25
			pistolAmmoCount.scaleX = 0.5
			pistolAmmoCount.scaleY = 0.5
			shotgunAmmoCount.scaleX = 0.5
			shotgunAmmoCount.scaleY = 0.5
			var text15:TextField = new TextField();
			text15.alpha = 0.5;
			var maxWeight:Number = 20;
			var garbageCan:Sprite = new garbageCanIcon();
			garbageCan.y = 25;
			garbageCan.x = 25;
			garbageCan.scaleX = 0.5;
			garbageCan.scaleY = 0.5;
			currentBackpack.y = 25;
			currentBackpack.x = 65;
			currentBackpack.scaleX = 0.4;
			currentBackpack.scaleY = 0.4;
			LRScroller.y = menuBG.height / 1.5;
			menuTabUp.y = -1 / 2 * menuTabUp.height;
			menuTabUp.x = 300;
			menuTabDown.y = -1 / 2 * menuTabDown.height;
			menuTabDown.x = 300;
			menuTabDown.visible = false;
			menuTabRight.x = 1.5 * menuTabRight.width;
			menuTabLeft.x = 600 - (1.5 * menuTabLeft.width);
			menuTabRight.y = menuBG.height / 1.5;
			menuTabLeft.y = menuBG.height / 1.5;
			var currentDrag:MovieClip = new MovieClip();
			var currentDragX:Number;
			var currentDragY:Number;
			var currentDragPos:int;
			var menuLeftReg:Sprite = new Sprite()
			menuLeftReg.graphics.beginFill(0x000000,0.001)
			menuLeftReg.graphics.drawRect(0,40,30,80)
			menuLeftReg.graphics.endFill()
			scroller.addChild(menuLeftReg)
			var menuRightReg:Sprite = new Sprite()
			menuRightReg.graphics.beginFill(0x000000,0.001)
			menuRightReg.graphics.drawRect(570,40,30,80)
			menuRightReg.graphics.endFill()
			scroller.addChild(menuRightReg)
			var leftRegTimer:int = 0
			var rightRegTimer:int = 0
			var currentMenuPosition:int = 0
			menuTabUp.addEventListener(MouseEvent.MOUSE_DOWN, menuUpControl);
			menuButtons()

			//bars;
			var healthBar:Sprite = new healthIcon();
			var energyBar:Sprite = new energyIcon();
			var adrenalineBar:Sprite = new adrenalineIcon();
			var thirstBar:Sprite = new thirstIcon();
			var hungerBar:Sprite = new hungerIcon();
			var attentionBar:Sprite = new attentionIcon();
			var healthBarBG:Sprite = new barBG();
			var energyBarBG:Sprite = new barBG();
			var adrenalineBarBG:Sprite = new barBG();
			var thirstBarBG:Sprite = new barBG();
			var hungerBarBG:Sprite = new barBG();
			var attentionBarBG:Sprite = new barBG();
			var healthBarFlair:Sprite = new barFlair();
			var energyBarFlair:Sprite = new barFlair();
			var adrenalineBarFlair:Sprite = new barFlair();
			var thirstBarFlair:Sprite = new barFlair();
			var hungerBarFlair:Sprite = new barFlair();
			var attentionBarFlair:Sprite = new barFlair2();
			healthBarBG.x = 4;
			healthBarBG.y = 3;
			healthBarFlair.x = 4;
			healthBarFlair.y = 3;
			healthBarFlair.alpha = 0.5;
			energyBarBG.x = 4;
			energyBarBG.y = 23.95;
			energyBarFlair.x = 4;
			energyBarFlair.y = 23.95;
			energyBarFlair.alpha = 0.5;
			adrenalineBarBG.x = 4;
			adrenalineBarBG.y = 44.9;
			adrenalineBarFlair.x = 4;
			adrenalineBarFlair.y = 44.9;
			adrenalineBarFlair.alpha = 0.5;
			thirstBarBG.x = 4;
			thirstBarBG.y = 65.85;
			thirstBarFlair.x = 4;
			thirstBarFlair.y = 65.85;
			thirstBarFlair.alpha = 0.5;
			hungerBarBG.x = 4;
			hungerBarBG.y = 86.8;
			hungerBarFlair.x = 4;
			hungerBarFlair.y = 86.8;
			hungerBarFlair.alpha = 0.5;
			attentionBarBG.x = 4;
			attentionBarBG.y = 107.75;
			attentionBarFlair.x = 8.05;
			attentionBarFlair.y = 107.75;
			healthBar.x = 11;
			healthBar.y = 6.95;
			energyBar.x = 11;
			energyBar.y = 6.95 + 20.95;
			adrenalineBar.x = 11;
			adrenalineBar.y = 6.95 + 20.95 + 20.95;
			thirstBar.x = 11;
			thirstBar.y = 6.95 + 20.95 + 20.95 + 20.95;
			hungerBar.x = 11;
			hungerBar.y = 6.95 + 20.95 + 20.95 + 20.95 + 20.95;
			attentionBar.x = 11;
			attentionBar.y = 6.95 + 20.95 + 20.95 + 20.95 + 20.95 + 20.95;

			//watch
			var watchC:Sprite = new Sprite();
			watchC.x = 550;
			watchC.y = 50;
			watchC.scaleX = 0.25;
			watchC.scaleY = 0.25;
			var clockBG:Sprite = new watchBG();
			watchC.addChild(clockBG);
			for (var i:int = 0; i < 60; i++)
			{
				if (i / 5 is int)
				{
					a = new clockMark();
					watchC.addChild(a);
					a.y = 120 * Math.sin((i * 6) * (Math.PI / 180));
					a.x = 120 * Math.cos((i * 6) * (Math.PI / 180));
				}
				a = new clockTick();
				watchC.addChild(a);
				a.y = 150 * Math.sin((i * 6) * (Math.PI / 180));
				a.x = 150 * Math.cos((i * 6) * (Math.PI / 180));
				a.rotation = (i * 6) + 90;
			}
			var hourHand:Sprite = new HHand();
			watchC.addChild(hourHand);
			var minuteHand:Sprite = new MHand();
			watchC.addChild(minuteHand);
			var secondHand:Sprite = new SHand();
			watchC.addChild(secondHand);
			var clockTop:Sprite = new watchTop();
			watchC.addChild(clockTop);
			var normalText:TextFormat = new TextFormat();
			var text14:TextField = new TextField();
			text14.scaleX = 4;
			text14.scaleY = 4;
			textFormatting(text14, "a", false, 0, 0, 500, 33, normalText, 0xFFFFFF, "Calibri", 20, true, false, "right");
			var clockTimer:int = 0;
			var seconds:int = Math.round(Math.random() * 60);
			var minutes:int = Math.round(Math.random() * 30) + 30;
			var hours:int = 12;
			if (Math.random() * 2 >= 1)
			{
				hours -=  1;
				minutes +=  30;
			}
			else
			{
				hours +=  1;
				minutes -=  30;
			}
			var halfDays:int = 0;
			var days:int = 1;
			watchC.addEventListener(MouseEvent.ROLL_OVER, clockTextOver);

			//obstacles
			//boundaries
			var cityBoundary1:Sprite = new boundary1();
			cityBoundary1.x = 959.175 - (city.width / 2);
			cityBoundary1.y = 10008.443 - (city.height / 2);
			var cityBoundary2:Sprite = new boundary1();
			cityBoundary2.x = 975.757 - (city.width / 2);
			cityBoundary2.y = 9665.322 - (city.height / 2);
			var cityBoundary3:Sprite = new boundary2();
			cityBoundary3.x = 1776.918 - (city.width / 2);
			cityBoundary3.y = 8276.063 - (city.height / 2);
			var cityBoundary4:Sprite = new boundary3();
			cityBoundary4.x = 1779.177 - (city.width / 2);
			cityBoundary4.y = 8270.543 - (city.height / 2);
			var cityBoundary5:Sprite = new boundary4();
			cityBoundary5.x = 2033.152 - (city.width / 2);
			cityBoundary5.y = 6883.607 - (city.height / 2);
			var cityBoundary6:Sprite = new boundary5();
			cityBoundary6.x = 2031.898 - (city.width / 2);
			cityBoundary6.y = 6884.184 - (city.height / 2);
			var cityBoundary7:Sprite = new boundary6();
			cityBoundary7.x = 3530.602 - (city.width / 2);
			cityBoundary7.y = 5188.075 - (city.height / 2);
			var cityBoundary8:Sprite = new boundary7();
			cityBoundary8.x = 914.106 - (city.width / 2);
			cityBoundary8.y = 5189.181 - (city.height / 2);
			var cityBoundary9:Sprite = new boundary9();
			cityBoundary9.x = 1197.075 - (city.width / 2);
			cityBoundary9.y = 3897.626 - (city.height / 2);
			var cityBoundary10:Sprite = new boundary10();
			cityBoundary10.x = 4617.795 - (city.width / 2);
			cityBoundary10.y = 966.628 - (city.height / 2);
			var cityBoundary11:Sprite = new boundary11();
			cityBoundary11.x = 4620.246 - (city.width / 2);
			cityBoundary11.y = 970.116 - (city.height / 2);
			var cityBoundary12:Sprite = new boundary12();
			cityBoundary12.x = 3477.886 - (city.width / 2);
			cityBoundary12.y = 14126.951 - (city.height / 2);
			var riverBoundary1:Sprite = new riverUpperBoundary();
			riverBoundary1.x = 7290.542 - (city.width / 2);
			riverBoundary1.y = 595.148 - (city.height / 2);
			var riverBoundary2:Sprite = new riverRightBoundary();
			riverBoundary2.x = 7286.463 - (city.width / 2);
			riverBoundary2.y = 5158.195 - (city.height / 2);
			var riverBoundary3:Sprite = new riverLowerBoundary();
			riverBoundary3.x = 4200.565 - (city.width / 2);
			riverBoundary3.y = 12603.418 - (city.height / 2);
			var riverBoundary4:Sprite = new riverLeftBoundary();
			riverBoundary4.x = 2092.515 - (city.width / 2);
			riverBoundary4.y = 12614.238 - (city.height / 2);
			var yellowBoundary1:Sprite = new yellowBottomBoundary();
			yellowBoundary1.x = 5650.935 - (city.width / 2);
			yellowBoundary1.y = 9570.633 - (city.height / 2);
			var yellowBoundary2:Sprite = new yellowLeftBoundary();
			yellowBoundary2.x = 5652.445 - (city.width / 2);
			yellowBoundary2.y = 7595.077 - (city.height / 2);
			var yellowBoundary3:Sprite = new yellowLowerRightBoundary();
			yellowBoundary3.x = 6882.149 - (city.width / 2);
			yellowBoundary3.y = 8700.836 - (city.height / 2);
			var yellowBoundary4:Sprite = new yellowUpperRightBoundary();
			yellowBoundary4.x = 6264.105 - (city.width / 2);
			yellowBoundary4.y = 7595.298 - (city.height / 2);
			var yellowBoundary5:Sprite = new yellowLowerTopBoundary();
			yellowBoundary5.x = 6263.098 - (city.width / 2);
			yellowBoundary5.y = 8699.834 - (city.height / 2);
			var yellowBoundary6:Sprite = new yellowUpperTopBoundary();
			yellowBoundary6.x = 5651.942 - (city.width / 2);
			yellowBoundary6.y = 7594.297 - (city.height / 2);
			var hospitalBoundary1:Sprite = new hospitalSideBoundary();
			hospitalBoundary1.x = 4996.249 - (city.width / 2);
			hospitalBoundary1.y = 2345.653 - (city.height / 2);
			var hospitalBoundary2:Sprite = new hospitalEndBoundary();
			hospitalBoundary2.x = 4991.758 - (city.width / 2);
			hospitalBoundary2.y = 2346.764 - (city.height / 2);
			var hospitalBoundary3:Sprite = new hospitalSideBoundary();
			hospitalBoundary3.x = hospitalBoundary1.x + hospitalBoundary2.width - hospitalBoundary3.width;
			hospitalBoundary3.y = hospitalBoundary1.y;
			var hospitalBoundary4:Sprite = new hospitalEndBoundary();
			hospitalBoundary4.x = hospitalBoundary2.x;
			hospitalBoundary4.y = hospitalBoundary2.y + hospitalBoundary1.height - hospitalBoundary4.height;
			var oneTop:Sprite = new buildingOneTop();
			oneTop.x = 1753.469 - (city.width / 2);
			oneTop.y = 9311.85 - (city.height / 2);
			var twoTop:Sprite = new buildingTwoTop();
			twoTop.x = 1750.782 - (city.width / 2);
			twoTop.y = 10005.824 - (city.height / 2);
			var threeTop:Sprite = new buildingThreeTop();
			threeTop.x = 2660.787 - (city.width / 2);
			threeTop.y = 10002.828 - (city.height / 2);
			var fourTop:Sprite = new buildingFourTop();
			fourTop.x = 1748.013 - (city.width / 2);
			fourTop.y = 10344.307 - (city.height / 2);
			var fiveTop:Sprite = new buildingFiveTop();
			fiveTop.x = 2388.594 - (city.width / 2);
			fiveTop.y = 8516.32 - (city.height / 2);
			var sixTop:Sprite = new buildingSixTop();
			sixTop.x = 2367.532 - (city.width / 2);
			sixTop.y = 7623.375 - (city.height / 2);
			var sevenTop:Sprite = new buildingSevenTop();
			sevenTop.x = 1747.009 - (city.width / 2);
			sevenTop.y = 11222.416 - (city.height / 2);
			var eightTop:Sprite = new buildingEightTop();
			eightTop.x = 4200.224 - (city.width / 2);
			eightTop.y = 11222.91 - (city.height / 2);
			var nineTop:Sprite = new buildingNineTop();
			nineTop.x = 5153.779 - (city.width / 2);
			nineTop.y = 11223.764 - (city.height / 2);
			var tenTop:Sprite = new buildingTenTop();
			tenTop.x = 4292.204 - (city.width / 2);
			tenTop.y = 6423.164 - (city.height / 2);
			var elevenTop:Sprite = new buildingElevenTop();
			elevenTop.x = 5652.445 - (city.width / 2);
			elevenTop.y = 7595.298 - (city.height / 2);
			var twelveTop:Sprite = new buildingTwelveTop();
			twelveTop.x = 4202.566 - (city.width / 2);
			twelveTop.y = 9502.898 - (city.height / 2);
			var thirteenTop:Sprite = new buildingThirteenTop();
			thirteenTop.x = 4996.4 - (city.width / 2);
			thirteenTop.y = 2344.327 - (city.height / 2);
			var searchableArray:Array = new Array();
			var searchItemsArray:Array = new Array();
			var crashedHelicopter:Sprite = new crashedChopper();
			crashedHelicopter.x = 529.153 - (city.width / 2);
			crashedHelicopter.y = 9365.15 - (city.height / 2);
			//cars
			var carRotation:Array = new Array(-160,175,105,156,171,-146,148,-147,-155,180,0,90,90,180,0);
			var carxPosition:Array = new Array(1855,1836,1793,1946,1915,1965,1910,1898,2087,5220,6128,5256,5126,2864,2864);
			var caryPosition:Array = new Array(4005,4136,4310,4440,4564,4710,4868,5080,4950,5767,6145,9380,9380,11537,11789);
			for (i = 0; i < carRotation.length * 2; i++)
			{
				var newCar:Sprite = new Car(searchableArray,searchItemsArray);
				if (i < carRotation.length)
				{
					newCar.rotation = carRotation[i];
					newCar.x = carxPosition[i] - (city.width / 2);
					newCar.y = caryPosition[i] - (city.height / 2);
				}
				else if (i >= carRotation.length)
				{
					newCar.rotation = carRotation[i - carRotation.length];
					newCar.x = carxPosition[i - carRotation.length] - (city.width / 2) + 7000;
					newCar.y = caryPosition[i - carRotation.length] - (city.height / 2);
				}
				obstaclesC.addChild(newCar);
				Global.vars.obstacleArray.push(newCar);
			}
			for (i = 0; i < Math.round(Math.random() * 40) + 30; i++)
			{
				for (j = 0; j < 4; j++)
				{
					newCar = new Car(searchableArray,searchItemsArray);
					obstaclesC.addChild(newCar);
					Global.vars.obstacleArray.push(newCar);
					newCar.width = 200;
					newCar.rotation = -90;
					newCar.x = 3662 - 10 + (Math.random() * 20) + (145 * j) - (city.width / 2);
					newCar.y = 5270 + ((i * newCar.height) + (i * 25) + (Math.random() * 20)) - (city.height / 2);
				}
			}
			var carContainer1:Sprite = new pixel();
			carContainer1.alpha = 0;
			carContainer1.width = 8000;
			carContainer1.height = 1070;
			carContainer1.x = 1264 + (carContainer1.width / 2) - (city.width / 2);
			carContainer1.y = 5070 - (city.height / 2);
			city.addChild(carContainer1);
			for (i = 0; i < 5000; i++)
			{
				newCar = new Car(searchableArray,searchItemsArray);
				obstaclesC.addChild(newCar);
				Global.vars.obstacleArray.push(newCar);
				newCar.rotation = 180;
				newCar.x = carContainer1.x - (carContainer1.width / 2) + (Math.random() * carContainer1.width);
				newCar.y = carContainer1.y - carContainer1.height + (Math.random() * carContainer1.height);
				for (j = 1; j < Global.vars.obstacleArray.length; j++)
				{
					if (Global.vars.obstacleArray[j - 1].hitTestObject(newCar))
					{
						Global.vars.obstacleArray.pop();
						obstaclesC.removeChild(newCar);
						break;
					}
				}
			}
			//buildings
			var door1:Sprite = new doorReg1()
			city.addChild(door1)
			door1.x = 1989.476 - (city.width / 2)
			door1.y = 9672.481 - (city.height / 2)

			searchableArray.push(crashedHelicopter);
			searchItemsArray.push(new Array(new C4Icon(),new revolverIcon(),new waterBottleFullIcon()));
			Global.vars.obstacleArray.push(cityBoundary1,cityBoundary2,cityBoundary3,cityBoundary4,cityBoundary5,cityBoundary6,cityBoundary7,cityBoundary8,cityBoundary9,cityBoundary10,cityBoundary11,cityBoundary12,riverBoundary1,riverBoundary2,riverBoundary3,riverBoundary4,yellowBoundary1,yellowBoundary2,yellowBoundary3,yellowBoundary4,yellowBoundary5,yellowBoundary6,hospitalBoundary1,hospitalBoundary2,hospitalBoundary3,hospitalBoundary4,crashedHelicopter,oneTop,twoTop,threeTop,fourTop,fiveTop,sixTop,sevenTop,eightTop,nineTop,tenTop,twelveTop);
			city.x = 5711.78;
			city.y = -2004.374;
			children();
			obstacleChildren();
			overheadChildren();
			menuChildren();
			scroller.addChild(LRScroller);

			//actions
			var searchText:TextField = new TextField()
			overheadC.addChild(searchText)
			var barricadeExplosion:Function = new Action(detonatorIcon,updateMenu,itemPounds,new Function(),false,true,iconRelease,hero,
														 new C4Crater,"After",city,1989 - (city.width / 2),9676 - (city.height / 2),
														 new barricadeAfter1(),"After",obstaclesC,2417 - (city.width / 2),9863 - (city.height / 2),
														 new barricadeAfter2(),"After",obstaclesC,2377 - (city.width / 2),9684 - (city.height / 2),
														 new C4Placed(),"Before",city,2401 - (city.width / 2),9824 - (city.height / 2),
														 new barricadesBefore(),"Over",obstaclesC,2377 - (city.width / 2),9684 - (city.height / 2),
														 explode,"Function","After",null,null).Act;
			var C4Placement:Function = new Action(C4Icon,updateMenu,itemPounds,barricadeExplosion,false,false,iconRelease,hero,
												  new detonatorIcon(),"Recieved",0,null,null,
												  new barricadesBefore(),"Over",obstaclesC,2377 - (city.width / 2),9684 - (city.height / 2)).Act;
			var drinkWater:Function = new Action(waterBottleFullIcon,updateMenu,itemPounds,new Function(),false,true,iconRelease,hero,
												 drinkSmallWater,"Function","After",null,null,
												 new Sprite(),"Over",city,0,0,
												 new waterBottleEmptyIcon(),"Recieved",0,null,null).Act
			drinkWater()
			C4Placement()
			new Combination(lighterIcon,true,clothIcon,false,null,false,updateMenu,iconRelease)
			new Combination(lighterIcon,true,jacketIcon,false,null,false,updateMenu,iconRelease,heroClothes,jacket,0,0,false,jacketContainer)
			new Combination(knifeIcon,true,jacketIcon,false,new clothIcon(),true,updateMenu,iconRelease,heroClothes,jacket,0,0,false,jacketContainer)
			function explode():void
			{
				a = new Explosion(hero,city,300,2201,9824)
				city.addChild(a)
				a.x = 2401 - (city.width / 2)
				a.y = 9824 - (city.height / 2)
			}
			function drinkSmallWater():void
			{
				Global.vars.thirst -= (500 / (Global.vars.thirst + 30)) + 5
				drinkWater()
			}
			
			//guns
			var accuracyIndicator:Sprite
			var accuracyContainer:Sprite = new Sprite()
			var cancelShooting:Sprite = new redX()
			var revolverReloadTimer:int = 0
			var shotgunReloadTimer:int = 0
			var reloadTimer:int
			var revolverAmmo:int = 12
			var shotgunAmmo:int = 0
			var ammo:int
			var revolverClip:int = 6
			var shotgunClip:int = 2
			var clip:int
			var capacity:int
			var mouseTimer:int = 0
			var mouseXPosition1:Number
			var mouseXPosition2:Number
			var mouseYPosition1:Number
			var mouseYPosition2:Number
			var hypotArray = []
			var gunshotArray = []
			var xSlopeArray = []
			var ySlopeArray = []
			var maxPoint:Point = new Point()
			var minPoint:Point = new Point()
			var maxRotation:Number
			var minRotation:Number
			var recoil:int = 0
			var reloadTimer1:Sprite = new redBox()
			var reloadTimer2:Sprite = new redBox()
			menuC.addChild(reloadTimer1)
			menuC.addChild(reloadTimer2)
			function activateRevolver(e:MouseEvent):void
			{
				guns(revolver)
			}
			function activateShotgun(e:MouseEvent):void
			{
				guns(shotgun)
			}
			function guns(gun:Class):void
			{
				if (gun == revolver)
				{
					heroClothes(revolver,-32.7,-77.45,true,jacketContainer)
					reloadTimer = revolverReloadTimer
					ammo = revolverAmmo
					clip = revolverClip
					capacity = 6
				}
				else if (gun == shotgun)
				{
					heroClothes(shotgun,-34.75,-127,true,jacketContainer)
					reloadTimer = shotgunReloadTimer
					ammo = shotgunAmmo
					clip = shotgunClip
					capacity = 2
				}
				startShootMode()
				function startShootMode():void
				{
					scroller.addChild(cancelShooting)
					cancelShooting.x = 300
					scroller.y = 400
					menuTabDown.visible = false
					accuracyIndicator = new target()
					overheadC.addChild(accuracyContainer)
					accuracyContainer.addChild(accuracyIndicator)
					cancelShooting.addEventListener(MouseEvent.MOUSE_UP, stopShootMode)
					addEventListener(MouseEvent.MOUSE_DOWN,shoot)
					accuracyIndicator.addEventListener(Event.ENTER_FRAME,updateAccuracy)
				}
				function updateAccuracy(e:Event):void
				{
					if (reloadTimer > 0)
					{
						reloadTimer--
					}
					recoil /= 1.1
					accuracyContainer.x = stage.mouseX
					accuracyContainer.y = stage.mouseY
					var xleg:Number = accuracyContainer.x - hero.x
					var yleg:Number = accuracyContainer.y - hero.y
					var hypot:Number = Math.sqrt((xleg * xleg) + (yleg * yleg))
					accuracyContainer.rotation = (Math.atan2(yleg,xleg) * (180 / Math.PI))
					accuracyIndicator.width = 1.5
					if (gun == revolver)
					{
						accuracyIndicator.height = checkMouseMovement() + (recoil * 2) + 5 + (hypot / ((Global.vars.adrenaline / 10) + (Global.vars.energy / 5)))
					}
					if (gun == shotgun)
					{
						accuracyIndicator.height = checkMouseMovement() + (recoil * 3) + 10 + (hypot / ((Global.vars.adrenaline / 20) + (Global.vars.energy / 10)))
					}
					maxPoint.x = hero.x - (hypot * Math.cos(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX))) - ((accuracyIndicator.height / 2) * Math.cos(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX) + (Math.PI / 2)))
					maxPoint.y = hero.y - (hypot * Math.sin(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX))) - ((accuracyIndicator.height / 2) * Math.sin(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX) + (Math.PI / 2)))
					minPoint.x = hero.x - (hypot * Math.cos(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX))) - ((accuracyIndicator.height / 2) * Math.cos(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX) - (Math.PI / 2)))
					minPoint.y = hero.y - (hypot * Math.sin(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX))) - ((accuracyIndicator.height / 2) * Math.sin(Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX) - (Math.PI / 2)))
					maxRotation = (Math.atan2(hero.y - maxPoint.y,hero.x - maxPoint.x) * (180 / Math.PI)) - 90
					minRotation = (Math.atan2(hero.y - minPoint.y,hero.x - minPoint.x) * (180 / Math.PI)) - 90
					while(maxRotation < -180)
					{
						maxRotation += 360
					}
					while(minRotation < -180)
					{
						minRotation += 360
					}
					reloadTimer1.alpha = 1
					reloadTimer2.alpha = 1
					reloadTimer2.rotation = 180
					reloadTimer1.x = 300 - 33.25
					reloadTimer1.y = 400 - (33.25 / 2)
					reloadTimer2.x = 300 + 33.25
					reloadTimer2.y = 400 - (33.25 / 2)
					reloadTimer1.width = reloadTimer
					reloadTimer2.width = reloadTimer
					if (Key.isDown(82) && reloadTimer == 0)
					{
						reload()
					}
					hero.rotation = (Math.atan2(hero.y - stage.mouseY,hero.x - stage.mouseX) * (180 / Math.PI)) - 90 - (300 / hypot)
					function checkMouseMovement():Number
					{
						if (mouseTimer == 2)
						{
							mouseTimer = 0
							mouseXPosition1 = city.mouseX
							mouseYPosition1 = city.mouseY
						}
						else if (mouseTimer == 1)
						{
							mouseXPosition2 = city.mouseX
							mouseYPosition2 = city.mouseY
						}
						mouseTimer++
						var xleg:Number = mouseXPosition1 - mouseXPosition2
						var yleg:Number = mouseYPosition1 - mouseYPosition2
						var hypot:Number = Math.sqrt((xleg * xleg) + (yleg * yleg))
						if (hypot >= 0)
						{
							hypotArray.push(hypot)
						}
						var total:Number = 0
						for (i = 0; i < hypotArray.length; i++)
						{
							hypotArray[i] /= 1.075
							total += hypotArray[i]
							if (hypotArray[i] < 5)
							{
								hypotArray.splice(i,1)
								i--
							}
						}
						return 1 + ((total) / 10)
					}
				}
				function shoot(e:MouseEvent):void
				{
					for (i = 0; i < gunshotArray.length; i++)
					{
						if (overheadC.contains(gunshotArray[i]))
						{
							overheadC.removeChild(gunshotArray[i])
						}
					}
					removeEventListener(Event.ENTER_FRAME,bulletMovement)
					gunshotArray = []
					xSlopeArray = []
					ySlopeArray = []
					if (!cancelShooting.hitTestPoint(mouseX,mouseY) && reloadTimer == 0)
					{
						if (clip > 0)
						{
							var shots:int
							if (gun == revolver)
							{
								Global.vars.attention += 5
								recoil += 15
								whiteFG.alpha = 0.3
								shots = 1
							}
							else if (gun == shotgun)
							{
								Global.vars.attention += 15
								recoil += 40
								whiteFG.alpha = 0.4
								shots = Math.round(4 + (Math.random() * 3))
							}
							clip--
							for (i = 0; i < shots; i++)
							{
								a = new bullet()
								gunshotArray[i] = a
								overheadC.addChild(a)
								if ((maxRotation >= 0 && minRotation < 0) || (maxRotation < 0 && minRotation >= 0))
								{
									a.rotation = minRotation + (Math.random() * (maxRotation + minRotation))
								}
								else
								{
									a.rotation = minRotation + (Math.random() * (maxRotation - minRotation))
								}
								a.x = (-100 * Math.cos((a.rotation - 90) * (Math.PI / 180))) + hero.x + (79.13 * Math.cos((hero.rotation - 90 + 15.45) * (Math.PI / 180)) * (2 / 5))
								a.y = (-100 * Math.sin((a.rotation - 90) * (Math.PI / 180))) + hero.y + (79.13 * Math.sin((hero.rotation - 90 + 15.45) * (Math.PI / 180)) * (2 / 5))
								xSlopeArray[i] = Math.cos((a.rotation - 90) * (Math.PI / 180))
								ySlopeArray[i] = Math.sin((a.rotation - 90) * (Math.PI / 180))
							}
							addEventListener(Event.ENTER_FRAME,bulletMovement)
						}
						else
						{
							reload()
						}
					}
				}
				function reload():void
				{
					if (ammo >= capacity && clip == 0)
					{
						clip = capacity
						ammo -= capacity
						reloadTimer = 30 + (5 * (capacity - clip))
					}
					else if (ammo < 6 && ammo > 0 && clip == 0)
					{
						clip = ammo
						ammo = 0
						reloadTimer = 30 + (5 * (capacity - clip))
					}
					else if (ammo >= capacity && clip > 0 && clip < capacity)
					{
						ammo -= capacity - clip
						clip = capacity
						reloadTimer = 30 + (5 * (capacity - clip))
					}
					else if (ammo < (6 - clip) && ammo > 0 && clip > 0)
					{
						clip = ammo
						ammo = 0
						reloadTimer = 30 + (5 * (capacity - clip))
					}
				}
				function bulletMovement(e:Event):void
				{
					for (i = 0; i < gunshotArray.length; i++)
					{
						gunshotArray[i].x += 100 * xSlopeArray[i]
						gunshotArray[i].y += 100 * ySlopeArray[i]
						for (j = 0; j < infectedC.numChildren; j++)
						{
							if (gunshotArray[i].hitTestObject(infectedC.getChildAt(j)) && !(infectedC.getChildAt(j) is testCircle))
							{
								if (overheadC.contains(gunshotArray[i]))
								{
									overheadC.removeChild(gunshotArray[i])
								}
								if (Math.random() < 0.9)
								{
									if (Math.random() > 0.7)
									{
										a = new blood1()
										obstaclesC.addChild(a)
										a.x = (Math.random() * 20) - 10 + infectedC.getChildAt(j).x
										a.y = (Math.random() * 20) - 10 + infectedC.getChildAt(j).y
										a.rotation = Math.random() * 360
									}
									if (Math.random() > 0.7)
									{
										a = new blood2()
										obstaclesC.addChild(a)
										a.x = (Math.random() * 20) - 10 + infectedC.getChildAt(j).x
										a.y = (Math.random() * 20) - 10 + infectedC.getChildAt(j).y
										a.rotation = Math.random() * 360
									}
									if (Math.random() > 0.7)
									{
										a = new blood3()
										obstaclesC.addChild(a)
										a.x = (Math.random() * 20) - 10 + infectedC.getChildAt(j).x
										a.y = (Math.random() * 20) - 10 + infectedC.getChildAt(j).y
										a.rotation = Math.random() * 360
									}
									var zombieClassArray:Array = [zombie1,zombie2,zombie3,zombie4,zombie5,zombie6,zombie7,zombie8,zombie9]
									var deadZombieArray:Array = [zombie1Dead,zombie2Dead,zombie3Dead,zombie4Dead,zombie5Dead,zombie6Dead,zombie7Dead,zombie8Dead,zombie9Dead]
									var zombieClass:Class
									for (k = 0; k < zombieClassArray.length; k++)
									{
										a = infectedC.getChildAt(j)
										for (l = 0; l < a.numChildren; l++)
										{
											if (a.getChildAt(l) is zombieClassArray[k])
											{
												zombieClass = deadZombieArray[k]
											}
										}
									}
									var body:Sprite = new zombieClass()
									obstaclesC.addChild(body)
									body.x = infectedC.getChildAt(i).x
									body.y = infectedC.getChildAt(i).y
									body.rotation = Math.random() * 360
									body.scaleX = 0.6
									body.scaleY = 0.6
									infectedC.removeChild(infectedC.getChildAt(j))
								}
							}
						}
						for (j = 0; j < Global.vars.obstacleArray.length; j++)
						{
							if (gunshotArray[i].hitTestObject(Global.vars.obstacleArray[j]))
							{
								if (overheadC.contains(gunshotArray[i]))
								{
									overheadC.removeChild(gunshotArray[i])
								}
							}
						}
					}
					if (checkChildren())
					{
						removeEventListener(Event.ENTER_FRAME,bulletMovement)
					}
					function checkChildren():Boolean
					{
						for (i = 0; i < gunshotArray.length; i++)
						{
							if (overheadC.contains(gunshotArray[i]))
							{
								return false
							}
						}
						return true
					}
				}
				function stopShootMode():void
				{
					if (gun == revolver)
					{
						revolverReloadTimer = reloadTimer
						revolverAmmo = ammo
						revolverClip = clip
					}
					else if (gun == shotgun)
					{
						shotgunReloadTimer = reloadTimer
						shotgunAmmo = ammo
						shotgunClip = clip
					}
					reloadTimer1.alpha = 0
					reloadTimer2.alpha = 0
					scroller.removeChild(cancelShooting)
					heroClothes(gun,0,0,false,jacketContainer)
					scroller.y = 280
					menuTabDown.visible = true
					overheadC.removeChild(accuracyContainer)
					accuracyContainer.removeChild(accuracyIndicator)
					cancelShooting.removeEventListener(MouseEvent.MOUSE_UP, stopShootMode)
					removeEventListener(MouseEvent.MOUSE_DOWN,shoot)
					accuracyIndicator.removeEventListener(Event.ENTER_FRAME,updateAccuracy)
				}
			}

			stage.addEventListener(Event.ENTER_FRAME, constantEvents);
			function constantEvents(e:Event):void
			{
				variableUpkeep();
				findWeapons()
				overheadVisibilityUpkeep();
				propertiesUpkeep();
				bars();
				clock();
				menuButtons();
				searchItems()
				Infected.checkInfected(20 + days + (halfDays / 2) + (hours / 24) + (minutes / 1440), infectedC, city, hero, Global.vars.obstacleArray);
			}
			function findWeapons():void
			{
				shotgunAmmoText.text = "" + shotgunAmmo
				pistolAmmoText.text = "" + revolverAmmo
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					if (Global.vars.menuItems[i] is revolverIcon)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP, activateRevolver, false, 0)
					}
					if (Global.vars.menuItems[i] is shotgunIcon)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP, activateShotgun, false, 0)
					}
				}
			}
			function variableUpkeep():void
			{
				Global.vars.city = city;
				Global.vars.buildingC.x = city.x
				Global.vars.buildingC.y = city.y
				Global.vars.obstaclesC = obstaclesC;
				Global.vars.infectedC = infectedC;
			}
			function searchItems():void
			{
				var format:TextFormat = new TextFormat("Calibri",12,0x000000,false,false,false,null,null,"center")
				searchText.defaultTextFormat = format;
				searchText.width = 147;
				searchText.height = 16;
				searchText.text = "Press Spacebar to search.";
				searchText.selectable = false
				searchText.x = 226.75;
				searchText.y = 31;
				searchText.multiline = false
				for (i = 0; i < searchableArray.length; i++)
				{
					if (hero.hitTestObject(searchableArray[i]))
					{
						searchText.alpha = 1
						if (Key.isDown(32))
						{
							for (j = 0; j < searchItemsArray[i].length; j++)
							{
								Global.vars.menuItems.push(searchItemsArray[i][j])
							}
							searchItemsArray.splice(i,1)
							searchableArray.splice(i,1)
						}
						break
					}
					else
					{
						searchText.alpha = 0
					}
				}
			}
			function iconGrab(e:MouseEvent):void
			{
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					if (Global.vars.menuItems[i] == e.currentTarget)
					{
						currentDrag = Global.vars.menuItems[i];
						currentDragPos = i;
						Global.vars.menuItems[i] = new pixel()
						Global.vars.menuItems[i].x = currentDrag.x
						Global.vars.menuItems[i].y = currentDrag.y
						Global.vars.menuItems[i].alpha = currentDrag.alpha
						currentDrag.startDrag();
						LRScroller.swapChildren(currentDrag,LRScroller.getChildAt(LRScroller.numChildren - 1))
					}
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
				}
			}
			function iconRelease(e:MouseEvent):void
			{
				if (stage.contains(currentDrag))
				{
					if (garbageCan.hitTestPoint(e.stageX,e.stageY))
					{
						Global.vars.menuItems.splice(currentDragPos, 1);
						itemPounds.splice(currentDragPos, 1);
					}
					else
					{
						currentDrag.x = Global.vars.menuItems[currentDragPos].x
						currentDrag.y = Global.vars.menuItems[currentDragPos].y
						currentDrag.alpha = Global.vars.menuItems[currentDragPos].alpha
						Global.vars.menuItems[currentDragPos] = currentDrag
					}
				}
				else
				{
					Global.vars.menuItems.splice(currentDragPos, 1);
					itemPounds.splice(currentDragPos, 1);
				}
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
				}
				currentDrag.stopDrag();
				currentDrag = new MovieClip();
			}
			function checkWeight():void
			{
				var totalWeight:Number = 0;
				Global.vars.walkHero = new Boolean();
				for (var i:int = 0; i < itemPounds.length; i++)
				{
					totalWeight +=  itemPounds[i];
				}
				if (totalWeight > maxWeight)
				{
					textFormatting(text15, totalWeight + " / " + maxWeight, false, -50, -50, 100, 60, new TextFormat(), 0xFF0000, "Calibri", 30, false, true, "center");
					Global.vars.walkHero = false;
				}
				else if (totalWeight <= maxWeight)
				{
					textFormatting(text15, totalWeight + " / " + maxWeight, false, -50, -50, 100, 60, new TextFormat(), 0x000000, "Calibri", 30, false, false, "center");
					Global.vars.walkHero = true;
				}
				currentBackpack.addChild(text15);
			}
			function menuScrollLeftControl(e:MouseEvent):void
			{
				menuTabRight.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
				menuTabLeft.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
				menuTabLeft.addEventListener(Event.ENTER_FRAME, menuScrollLeft);
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
				}
			}
			function menuScrollLeft(e:Event):void
			{
				var leftIcon:Sprite = Global.vars.menuItems[iconsLeft];
				var rightIcon:Sprite = Global.vars.menuItems[iconsLeft + 7];
				if (rightIcon.x > 510)
				{
					for (var i:int = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].x -=  70 / 35;
					}
					rightIcon.alpha +=  1 / 35;
					rightIcon.x -=  70 / 35;
					leftIcon.alpha -=  1 / 35;
					leftIcon.x -=  70 / 35;
				}
				else if (rightIcon.x <= 510)
				{
					currentMenuPosition++
					leftIcon.alpha = 0;
					rightIcon.alpha = 1;
					iconsLeft++;
					iconsRight--;
					menuTabLeft.removeEventListener(Event.ENTER_FRAME, menuScrollLeft);
					menuTabRight.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
					menuTabLeft.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
					for (i = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
					}
				}
			}
			function menuScrollRightControl(e:MouseEvent):void
			{
				menuTabRight.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
				menuTabLeft.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
				menuTabRight.addEventListener(Event.ENTER_FRAME, menuScrollRight);
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
				}
			}
			function menuScrollRight(e:Event):void
			{
				var leftIcon:Sprite = Global.vars.menuItems[iconsLeft - 1];
				var rightIcon:Sprite = Global.vars.menuItems[iconsLeft + 6];
				if (rightIcon.x < 650)
				{
					for (var i:int = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].x +=  70 / 35;
					}
					rightIcon.alpha -=  1 / 35;
					rightIcon.x +=  70 / 35;
					leftIcon.alpha +=  1 / 35;
					leftIcon.x +=  70 / 35;
				}
				else if (rightIcon.x >= 650)
				{
					currentMenuPosition--
					leftIcon.alpha = 1;
					rightIcon.alpha = 0;
					iconsLeft--;
					iconsRight++;
					menuTabRight.removeEventListener(Event.ENTER_FRAME, menuScrollRight);
					menuTabRight.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
					menuTabLeft.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
					for (i = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
					}
				}
			}
			function menuButtons():void
			{
				if (iconsRight > 0)
				{
					rightRegTimer++
					if (menuRightReg.hitTestPoint(stage.mouseX,stage.mouseY))
					{
						if (rightRegTimer > 10)
						{
							menuTabRight.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
							menuTabLeft.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
							menuTabLeft.addEventListener(Event.ENTER_FRAME, menuScrollLeft);
							for (i = 0; i < Global.vars.menuItems.length; i++)
							{
								Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
							}
						}
					}
					else
					{
						rightRegTimer = 0
					}
					menuTabLeft.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
					menuTabLeft.alpha = 1;
				}
				else if (iconsRight == 0)
				{
					menuTabLeft.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
					menuTabLeft.alpha = 0.5;
				}
				if (iconsLeft > 0)
				{
					leftRegTimer++
					if (menuLeftReg.hitTestPoint(stage.mouseX,stage.mouseY))
					{
						if (leftRegTimer > 10)
						{
							menuTabLeft.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
							menuTabRight.removeEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
							menuTabRight.addEventListener(Event.ENTER_FRAME, menuScrollRight);
							for (i = 0; i < Global.vars.menuItems.length; i++)
							{
								Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
							}
						}
					}
					else
					{
						leftRegTimer = 0
					}
					menuTabRight.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollRightControl);
					menuTabRight.alpha = 1;
				}
				else if (iconsLeft == 0)
				{
					menuTabRight.removeEventListener(Event.ENTER_FRAME, menuScrollRightControl);
					menuTabRight.alpha = 0.5;
				}
				if (LRScroller.numChildren != Global.vars.menuItems.length)
				{
					updateMenu()
				}
			}
			function updateMenu():void
			{
				currentDragX = 0
				currentDragY = 0
				currentDrag = new MovieClip()
				for (i = Global.vars.menuItems.length; i >= 0; i--)
				{
					if (Global.vars.menuItems[i] is pixel)
					{
						Global.vars.menuItems.splice(i,1)
					}
				}
				while (LRScroller.numChildren > 0)
				{
					LRScroller.removeChildAt(0);
				}
				checkWeight();
				menuTabLeft.addEventListener(MouseEvent.MOUSE_DOWN, menuScrollLeftControl);
				for (var j:int = 0; j < Global.vars.menuItems.length; j++)
				{
					LRScroller.addChild(Global.vars.menuItems[j]);
					if (Global.vars.menuItems.length < 7)
					{
						currentMenuPosition = 0
						iconsLeft = 0;
						iconsRight = 0;
						Global.vars.menuItems[j].alpha = 1;
						Global.vars.menuItems[j].y = 0
						Global.vars.menuItems[j].x = 10 + (((j + 1) / (Global.vars.menuItems.length + 1)) * 580);
					}
					else if (Global.vars.menuItems.length >= 7)
					{
						iconsLeft = currentMenuPosition;
						iconsRight = j - 6 - currentMenuPosition
						while (Global.vars.menuItems.length == currentMenuPosition + 6)
						{
							currentMenuPosition--
						}
						if (j < currentMenuPosition)
						{
							Global.vars.menuItems[j].alpha = 0;
							Global.vars.menuItems[j].x = -50 + (((j - currentMenuPosition) + 1) * 70);
						}
						else if (j > 6 + currentMenuPosition)
						{
							Global.vars.menuItems[j].alpha = 0;
							Global.vars.menuItems[j].x = 90 + (((j - currentMenuPosition) + 1) * 70);
						}
						else if (j >= currentMenuPosition && j <= 6 + currentMenuPosition)
						{
							Global.vars.menuItems[j].alpha = 1;
							Global.vars.menuItems[j].x = 20 + (((j - currentMenuPosition) + 1) * 70);
						}
					}
				}
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
					Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP, iconRelease,false,0);
				}
			}
			function becomingInfected(e:Event):void
			{
				infectedTime++;
				overheadVisibilityUpkeep();
				infectedPropertiesUpkeep();
				bars();
				clock();
				menuButtons();
				variableUpkeep();
				infectedBehavior();
			}
			function infectedBehavior():void
			{
				blackFG.alpha -=  Math.pow(infectedTime,1 / 16);
				yellowFG1.alpha = 1 - Math.pow(0.999995,infectedTime);
				whiteFG.alpha = 1 - (Math.pow(0.999995, infectedTime) * 1.15);
				heroBlood.alpha = 1 - Math.pow(0.999995,infectedTime);
				if (infectedTime > 1296000)
				{
					restartGame("You were infected. And you died.");
				}
				if (infectedTime > 648000 + (Math.random() * 1296000))
				{
					if (Math.random() > 0.5)
					{
						Global.vars.walkHero = false;
					}
					else
					{
						Global.vars.walkHero = true;
					}
				}
			}
			function infectedPropertiesUpkeep():void
			{
				Global.vars.health += (1 / 12960000) + (Global.vars.adrenaline / 1000000) + (Math.pow(infectedTime, 1 / 8) / 259200000);
				Global.vars.energy -= (1 / 2592000) + (Global.vars.adrenaline * Global.vars.adrenaline / 10000000) - (Math.sqrt(Math.sqrt(infectedTime)) / 259200000);
				Global.vars.adrenaline /=  1 + (Math.random() / 6);
				Global.vars.adrenaline +=  Math.pow(infectedTime,1 / 8) * Math.random();
				Global.vars.thirst -=  (1 / 1000000) + (Math.pow(infectedTime, 1 / 16) / 259200000);
				Global.vars.hunger -=  1 / 8800000;
				Global.vars.attention /=  1.00001;
				if (Global.vars.health > 100)
				{
					Global.vars.health = 100;
				}
				if (Global.vars.adrenaline > 100)
				{
					Global.vars.adrenaline = 100;
				}
				if (Global.vars.thirst > 100)
				{
					Global.vars.thirst = 100;
				}
				if (Global.vars.hunger > 100)
				{
					Global.vars.hunger = 100;
				}
				if (Global.vars.attention > 100)
				{
					Global.vars.attention = 100;
				}
				if (Global.vars.health <= 0)
				{
					restartGame("You got dead.");
				}
			}
			function propertiesUpkeep():void
			{
				Global.vars.health += (1 / 12960000) + (Global.vars.adrenaline / 1000000) - (1 / ((100 - Global.vars.thirst) * (100 - Global.vars.thirst) * 10000));
				Global.vars.energy -= (1 / 2592000) + (Global.vars.adrenaline * Global.vars.adrenaline / 10000000);
				Global.vars.adrenaline /=  1.002;
				Global.vars.thirst -=  1 / 1000000;
				Global.vars.hunger -=  1 / 2200000;
				Global.vars.attention /=  1.0000001;
				if (Global.vars.health > 100)
				{
					Global.vars.health = 100;
				}
				if (Global.vars.adrenaline > 100)
				{
					Global.vars.adrenaline = 100;
				}
				if (Global.vars.thirst > 100)
				{
					Global.vars.thirst = 100;
				}
				if (Global.vars.hunger > 100)
				{
					Global.vars.hunger = 100;
				}
				if (Global.vars.attention > 100)
				{
					Global.vars.attention = 100;
				}
				if (Global.vars.health <= 0)
				{
					restartGame("You got dead.");
				}
			}
			function bars():void
			{
				healthBar.width = 71 * (Global.vars.health / 100);
				energyBar.width = 71 * (Global.vars.energy / 100);
				adrenalineBar.width = 71 * (Global.vars.adrenaline / 100);
				thirstBar.width = 71 * (1 - (Global.vars.thirst / 100));
				hungerBar.width = 71 * (1 - (Global.vars.hunger / 100));
				attentionBar.width = 71 * (Global.vars.attention / 100);
			}
			function clock():void
			{
				text14.x = stage.mouseX - watchC.x - text14.width;
				text14.y = stage.mouseY - watchC.y;
				clockTimer +=  1;
				if (clockTimer >= 30)
				{
					clockTimer -=  30;
					seconds +=  1;
				}
				if (seconds >= 60)
				{
					seconds -=  60;
					minutes +=  1;
				}
				if (minutes >= 60)
				{
					minutes -=  60;
					hours +=  1;
				}
				if (hours >= 13)
				{
					hours -=  12;
					halfDays +=  1;
				}
				if (halfDays >= 2)
				{
					halfDays -=  2;
					days +=  1;
				}
				secondHand.rotation = seconds * 6;
				minuteHand.rotation = (minutes * 6) + (seconds / 10);
				hourHand.rotation = (hours * 30) + (minutes / 2);
				if (minutes == 0 && halfDays == 0)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + "00" + " A.M.";
				}
				else if (minutes == 0 && halfDays == 1)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + "00" + " P.M.";
				}
				if (minutes < 10 && halfDays == 0)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + "0" + minutes + " A.M.";
				}
				else if (minutes >= 10 && halfDays == 0)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + minutes + " A.M.";
				}
				else if (minutes < 10 && halfDays == 1)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + "0" + minutes + " P.M.";
				}
				else if (minutes >= 10 && halfDays == 1)
				{
					text14.text = "August " + (days + 3) + ", " + hours + ":" + minutes + " P.M.";
				}
				var totalMinutes:Number = minutes + ((hours - 1) * 60) + (halfDays * 12 * 60);
				if (totalMinutes >= 960 && totalMinutes < 1200)
				{
					for (i = 0; i <= 240; i++)
					{
						if (i == totalMinutes - 960)
						{
							blackFG.alpha = (i * (190 / 240)) / 200;
						}
					}
				}
				else if (totalMinutes >= 240 && totalMinutes < 480)
				{
					for (i = 0; i <= 240; i++)
					{
						if (i == totalMinutes - 240)
						{
							blackFG.alpha = ((-i + 240) * (190 / 240)) / 200;
						}
					}
				}
				else if (totalMinutes < 240 || totalMinutes >= 1200)
				{
					blackFG.alpha = 0.95;
				}
				else if (totalMinutes >= 480 && totalMinutes < 960)
				{
					blackFG.alpha = 0;
				}
				if (days >= 6)
				{
					restartGame("You were nuked. Unfortunately, \n you didn't survive");
				}
			}
			function clockTextOver(e:MouseEvent):void
			{
				watchC.addChild(text14);
				watchC.addEventListener(MouseEvent.ROLL_OUT, clockTextOut);
				watchC.removeEventListener(MouseEvent.ROLL_OVER, clockTextOver);
			}
			function clockTextOut(e:MouseEvent):void
			{
				watchC.removeChild(text14);
				watchC.addEventListener(MouseEvent.ROLL_OVER, clockTextOver);
				watchC.removeEventListener(MouseEvent.ROLL_OUT, clockTextOut);
			}
			function menuUpControl(e:MouseEvent):void
			{
				scroller.addEventListener(Event.ENTER_FRAME, menuUpEvent);
				menuTabUp.removeEventListener(MouseEvent.MOUSE_DOWN, menuUpControl);
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_UP,iconRelease)
				}
			}
			function menuUpEvent(e:Event):void
			{
				if (scroller.y > 280)
				{
					scroller.y -=  4;
				}
				else if (scroller.y <= 280)
				{
					menuTabDown.visible = true;
					menuTabUp.visible = false;
					scroller.removeEventListener(Event.ENTER_FRAME, menuUpEvent);
					menuTabDown.addEventListener(MouseEvent.MOUSE_DOWN, menuDownControl);
					for (i = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP, iconRelease,false,0);
					}
				}
			}
			function menuDownControl(e:MouseEvent):void
			{
				scroller.addEventListener(Event.ENTER_FRAME, menuDownEvent);
				menuTabDown.removeEventListener(MouseEvent.MOUSE_DOWN, menuDownControl);
				for (i = 0; i < Global.vars.menuItems.length; i++)
				{
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_DOWN,iconGrab)
					Global.vars.menuItems[i].removeEventListener(MouseEvent.MOUSE_UP,iconRelease)
				}
			}
			function menuDownEvent(e:Event):void
			{
				if (scroller.y < 400)
				{
					scroller.y +=  4;
				}
				else if (scroller.y >= 400)
				{
					menuTabDown.visible = false;
					menuTabUp.visible = true;
					scroller.removeEventListener(Event.ENTER_FRAME, menuDownEvent);
					menuTabUp.addEventListener(MouseEvent.MOUSE_DOWN, menuUpControl);
					for (i = 0; i < Global.vars.menuItems.length; i++)
					{
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_DOWN, iconGrab);
						Global.vars.menuItems[i].addEventListener(MouseEvent.MOUSE_UP, iconRelease,false,0);
					}
				}
			}
			function overheadVisibilityUpkeep():void
			{
				if (whiteFG.alpha > 0)
				{
					whiteFG.alpha -=  0.01;
				}
				if (yellowFG1.alpha > 0)
				{
					yellowFG1.alpha -=  0.001;
				}
				for (var i:int = 0; i < overheadC.numChildren; i++)
				{
					if (overheadC.getChildAt(i).alpha <= 0 && overheadC.getChildAt(i).visible == true)
					{
						overheadC.getChildAt(i).visible = false;
					}
					else if (overheadC.getChildAt(i).alpha > 0 && overheadC.getChildAt(i).visible == false)
					{
						overheadC.getChildAt(i).visible = true;
					}
				}
			}
			function children():void
			{
				addChild(city);
				addChild(hero);
				addChild(Global.vars.buildingC)
				addChild(overheadC);
				addChild(menuC);
				city.addChild(infectedC);
				city.addChild(obstaclesC);
			}
			function obstacleChildren():void
			{
				obstaclesC.addChild(riverBoundary1);
				obstaclesC.addChild(riverBoundary2);
				obstaclesC.addChild(riverBoundary3);
				obstaclesC.addChild(riverBoundary4);
				obstaclesC.addChild(hospitalBoundary1);
				obstaclesC.addChild(hospitalBoundary2);
				obstaclesC.addChild(hospitalBoundary3);
				obstaclesC.addChild(hospitalBoundary4);
				obstaclesC.addChild(yellowBoundary1);
				obstaclesC.addChild(yellowBoundary2);
				obstaclesC.addChild(yellowBoundary3);
				obstaclesC.addChild(yellowBoundary4);
				obstaclesC.addChild(yellowBoundary5);
				obstaclesC.addChild(yellowBoundary6);
				obstaclesC.addChild(cityBoundary1);
				obstaclesC.addChild(cityBoundary2);
				obstaclesC.addChild(cityBoundary3);
				obstaclesC.addChild(cityBoundary4);
				obstaclesC.addChild(cityBoundary5);
				obstaclesC.addChild(cityBoundary6);
				obstaclesC.addChild(cityBoundary7);
				obstaclesC.addChild(cityBoundary8);
				obstaclesC.addChild(cityBoundary9);
				obstaclesC.addChild(cityBoundary10);
				obstaclesC.addChild(cityBoundary11);
				obstaclesC.addChild(cityBoundary12);
				obstaclesC.addChild(crashedHelicopter);
				obstaclesC.addChild(oneTop);
				obstaclesC.addChild(twoTop);
				obstaclesC.addChild(threeTop);
				obstaclesC.addChild(fourTop);
				obstaclesC.addChild(fiveTop);
				obstaclesC.addChild(sixTop);
				obstaclesC.addChild(sevenTop);
				obstaclesC.addChild(eightTop);
				obstaclesC.addChild(nineTop);
				obstaclesC.addChild(tenTop);
				obstaclesC.addChild(elevenTop);
				obstaclesC.addChild(twelveTop);
				obstaclesC.addChild(thirteenTop);
			}
			function menuChildren():void
			{
				menuC.addChild(scroller);
				scroller.addChild(menuBG);
				scroller.addChild(pistolAmmoCount);
				scroller.addChild(shotgunAmmoCount);
				scroller.addChild(pistolAmmoText);
				scroller.addChild(shotgunAmmoText);
				scroller.addChild(garbageCan);
				scroller.addChild(currentBackpack);
				scroller.addChild(menuTabUp);
				scroller.addChild(menuTabDown);
				scroller.addChild(menuTabRight);
				scroller.addChild(menuTabLeft);
				menuC.addChild(watchC);
				menuC.addChild(healthBarBG);
				menuC.addChild(healthBar);
				menuC.addChild(healthBarFlair);
				menuC.addChild(energyBarBG);
				menuC.addChild(energyBar);
				menuC.addChild(energyBarFlair);
				menuC.addChild(adrenalineBarBG);
				menuC.addChild(adrenalineBar);
				menuC.addChild(adrenalineBarFlair);
				menuC.addChild(thirstBarBG);
				menuC.addChild(thirstBar);
				menuC.addChild(thirstBarFlair);
				menuC.addChild(hungerBarBG);
				menuC.addChild(hungerBar);
				menuC.addChild(hungerBarFlair);
				menuC.addChild(attentionBarBG);
				menuC.addChild(attentionBar);
				menuC.addChild(attentionBarFlair);
			}
			function overheadChildren():void
			{
				overheadC.addChild(whiteFG);
				overheadC.addChild(blackFG);
				overheadC.addChild(yellowFG1);
			}
		}
		public function blurItems(item1:Object, item2:Object, item3:Object, item4:Object, item5:Object, timer:int, gFilter:GlowFilter, bFilter:BlurFilter):void
		{
			addEventListener(Event.ENTER_FRAME, blurFunction);
			function blurFunction(e:Event):void
			{
				timer++;
				var randomBlur = Math.random() * 100;
				if (randomBlur <= 3 && timer >= 60)
				{
					bFilter.blurX = 50;
					bFilter.blurY = 20;
					gFilter.alpha = 1;
					item1.filters = new Array(bFilter,gFilter);
					item2.filters = new Array(bFilter,gFilter);
					item3.filters = new Array(bFilter,gFilter);
					item4.filters = new Array(bFilter,gFilter);
					item5.filters = new Array(bFilter,gFilter);
					removeEventListener(Event.ENTER_FRAME, blurFunction);
					addEventListener(Event.ENTER_FRAME, blurMenuItems);
				}
			}
			function blurMenuItems(e:Event):void
			{
				if (bFilter.blurX != 0)
				{
					bFilter.blurX -=  1;
					bFilter.blurY -=  0.75;
					gFilter.alpha -=  0.05;
					item1.filters = new Array(bFilter,gFilter);
					item2.filters = new Array(bFilter,gFilter);
					item3.filters = new Array(bFilter,gFilter);
					item4.filters = new Array(bFilter,gFilter);
					item5.filters = new Array(bFilter,gFilter);
				}
				else if (bFilter.blurX == 0)
				{
					timer = 0;
					removeEventListener(Event.ENTER_FRAME, blurMenuItems);
					addEventListener(Event.ENTER_FRAME, blurFunction);
				}
			}
		}
		public function clearEverything():void
		{
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			graphics.clear();
		}
		public function textFormatting(tf:TextField, txt:String, sel:Boolean, xPos:Number, yPos:Number, wd:Number, ht:Number, formatName:TextFormat, clr:Object, fnt:String, sz:Number, mlt:Boolean, bld:Boolean, aln:String):void
		{
			formatName.font = fnt;
			formatName.color = clr;
			formatName.size = sz;
			formatName.align = aln;
			formatName.bold = bld;
			addChild(tf);
			tf.defaultTextFormat = formatName;
			tf.width = wd;
			tf.height = ht;
			tf.text = txt;
			tf.selectable = sel;
			tf.x = xPos;
			tf.y = yPos;
			tf.multiline = mlt;
		}
	}
}