package items{
	import flash.display.Sprite;

	public class MContainer extends Sprite //磁场容器
	{
		public function MContainer(trackNumber:int):void{
			_i=Math.ceil((Math.random()*4));
			this.y=_trackPosition[trackNumber];
			/*trace(_i);*/
			switch(_i){
				case 1:
					_shape=new MagneticField1();
					useable=true;
					break;
				case 2:
					_shape=new MagneticField2();
					useable=true;
					break;
			}
			this.x=620;
			this.prevx=x;
			this.addChild(_shape);
		}
		public var useable:Boolean=false;
		public var prevx:Number;
		private var _i:Number;
		private var _shape:Sprite=new Sprite();
		private var _trackPosition:Array=new Array(45,145,245);
	}
}