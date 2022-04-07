package items{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.MovieClip;
	
	public class PContainer extends Sprite{						//玩家容器
		
		public function changeMove(evt:KeyboardEvent):void{			//改变运动状态
			switch(evt.charCode){
				case 119:
					if(trackNumber!=0){trackNumber--;};break;
				case 115:
					if(trackNumber!=2){trackNumber++;};break;
				case 100:
					if(f!=0.2){f+=0.1;aS.signPositionNumber+=1;};break;
				case 97:
					if(f!=-0.2){f-=0.1;aS.signPositionNumber-=1;};break;
			}
			y=trackPosition[trackNumber];
			aS.sign.x=aS.signPosition[aS.signPositionNumber+2];
		}
		public function reflesh():void{
			x+=v;v+=f;
		}
		public var aS:aShower=new aShower();					//加速度显示
		public var trackNumber:int;								//导轨序号
		public var f:Number;									//加速度
		public var prevx:Number;								//过去的x坐标
		public var v:Number;									//速度
		public var trackPosition:Array=new Array(40,140,240);
		private var _pSkin:MovieClip=new WireLine2;
		/*private var shapeData:WireLine=new WireLine();
		private var shape:Bitmap=new Bitmap()*/
		
		public function PContainer() {
			v=0;f=0;
			trackNumber=1;
			x=200;y=trackPosition[trackNumber];
			prevx=x;
			addChild(_pSkin);
			
		}
	}
}