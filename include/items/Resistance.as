package items{
	import flash.display.Shape;

	public class Resistance extends Shape{
		public function drawR():void{
			graphics.lineStyle(2);
			graphics.lineTo(0,20);
			graphics.lineTo(-5,20);
			graphics.lineTo(-5,80);
			graphics.lineTo(5,80);
			graphics.lineTo(5,20);
			graphics.lineTo(0,20);
			graphics.moveTo(0,80);
			graphics.lineTo(0,100);
		}
		public var useable:Boolean=false;
		public function Resistance(){
			x=520;
		}
	}
}