package items{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class aShower extends Sprite{
		private var t1:TextField=new TextField();
		private var t2:TextField=new TextField();
		private var t3:TextField=new TextField();
		private var t4:TextField=new TextField();
		private var t5:TextField=new TextField();
		/*public var sign:Shape=new Shape();*/
		public var sign:Bitmap=new Bitmap();
		private var signData:BitmapData=new Arrow();
		public var signPositionNumber=0;
		public var signPosition:Array=new Array(-60,-30,0,30,60);
		public function aShower() {
			t1.text="max";t2.text="1/2";t3.text="0";t4.text="1/2";t5.text="max";
			t1.x=-60;t2.x=-30;t3.x=5;t4.x=30;t5.x=60;
			x=255;y=380;
			sign.bitmapData=signData;
			sign.y=-20;
			this.addChild(sign);
			/*sign.graphics.beginFill(0xfffffe,0);
			sign.graphics.lineStyle(2,0x00ff00);
			sign.graphics.drawRect(0,0,20,20);
			sign.graphics.endFill();*/
			addChild(t1);addChild(t2);addChild(t3);addChild(t4);addChild(t5);
			addChild(sign);
		}

	}
	
}
