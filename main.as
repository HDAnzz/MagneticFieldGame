package {
	import items.*;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.text.TextFormat;

	public class main extends MovieClip{
		public function main(){
			for(var i:int=0;i<=2;i++){
				r[i].y=100*i+50;this.addChild(r[i]);
				this.addChild(m[i]);
			}
			p.aS.alpha=0;
			scoreShower.x=460;scoreShower.y=0;
			scoreShower.defaultTextFormat=new TextFormat("Microsoft YaHei UI",15);
			scoreShower.text="score:"+score.toString();
			this.addChild(scoreShower);
			this.addChild(p);this.addChild(p.aS);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN,p.changeMove);
			this.addEventListener(Event.ENTER_FRAME,reflesh);
		}
		var absv:int=3;
		var t:uint=0;
		var score:uint=0;
		var flag:Number;
		var prevdx:Number;
		var dx:Number;
		var r1:Resistance=new Resistance();
		var r2:Resistance=new Resistance();
		var r3:Resistance=new Resistance();
		var m1:MContainer=new MContainer(0);
		var m2:MContainer=new MContainer(1);
		var m3:MContainer=new MContainer(2);
		var r:Array=new Array(r1,r2,r3);
		var m:Array=new Array(m1,m2,m3);
		var p:PContainer=new PContainer();
		var scoreShower:TextField=new TextField();
		var text1:TextField=new TextField();
		var replay:ReplayButton=new ReplayButton();
		function reflesh(evt:Event):void{
			if(p.f!=0 && p.aS.alpha<1){
				p.aS.alpha+=0.05;
			}
			if(p.f==0 && p.aS.alpha>0){
				p.aS.alpha-=0.05;
			}
			if(t%5==0 && t!=0){												//分数刷新
				score++;scoreShower.text="score:"+score.toString();
			}
//————————————————————————————————————————————————————//
			if(t%50==0){													//电阻刷新
				switch((t/50)%3+1){
					case 1:													//三个电阻都可用，消除三个电阻，随机生成一个电阻
						for(var j:int=0;j<3;j++){
							r[j].graphics.clear();r[j].useable=false;
						}
						flag=Math.floor(Math.random()*3);
						if(r[flag].useable!=true){r[flag].drawR();r[flag].useable=true;}
						/*trace(t);*/
						break;
					case 2:													//一个电阻可用，随机在剩下的空位中生成一个电阻
						flag=Math.floor(Math.random()*2);/*trace(flag);*/
						for(var k:int=0;k<3;k++){
							if(flag==0 && r[k].useable==false){r[k].drawR();r[k].useable=true;break;}
							if(r[k].useable==false){flag--;}
						}
						break;
					case 3:													//两个电阻可用，在剩下的空位中生成一个电阻
						for(var l:int=0;l<3;l++){
							if(r[l].useable==false){r[l].drawR();r[l].useable=true;}
						}
						break;
				}
			}
			if(t%400==0 && t!=0){													//加速
				absv+=3;
			}
//————————————————————————————————————————————————————//时间刷新
			t++;/*trace(t);*/
//————————————————————————————————————————————————————//磁场刷新
			m[0].prevx=m[0].x;
			for(var i:int=0;i<=2;i++)
			{
				m[i].x-=absv;
				if(m[i].x<-60){
					removeChild(m[i]);m[i]=new MContainer(i);addChild(m[i]);
				}
			}
//————————————————————————————————————————————————————//玩家刷新
			prevdx=p.prevx-m[0].prevx;
			dx=p.x-m[0].x;
			/*trace(m[0].x+" "+m[0].prevx+" "+p.prevx+" "+p.x+" "+prevdx+" "+dx);*/
			if(m[p.trackNumber].useable==true && r[p.trackNumber].useable==true){
				/*trace(prevdx+" "+dx);*/
				if(prevdx<=0 && dx>0 && dx-100<=0){p.v-=0.1*dx;}
				if(prevdx<=0 && dx>0 && dx-100>0){p.v-=5;}
				if(prevdx>0 && prevdx<=100 && dx>0 && dx-100<=0 ){p.v-=0.1*(dx-prevdx);}
				if(prevdx>0 && prevdx<=100 && dx>100){p.v-=0.1*(100-prevdx);}
				if(prevdx>0 && prevdx<=100 &&dx <=0){p.v+=0.1*prevdx;}
				if(prevdx>100 && dx<=0){p.v+=5;}
				if(prevdx>100 && dx>0 && dx<=100){p.v+=0.1*(100-dx);}
			}
			p.prevx=p.x;
			p.reflesh();
//————————————————————————————————————————————————————//
			if(p.x<20 || p.x>520){											//游戏结束
				this.stage.removeEventListener(KeyboardEvent.KEY_DOWN,p.changeMove);
				this.removeEventListener(Event.ENTER_FRAME,reflesh);
				text1.defaultTextFormat=new TextFormat("New Courier",30,0xff0000);
				text1.width=500;
				text1.text="YOU FAILED!";
				text1.x=180;text1.y=200;
				replay.x=250;replay.y=250;
				this.addChild(text1);this.addChild(replay);
				replay.addEventListener(MouseEvent.CLICK,replaygame);
			}
		}
		function replaygame(evt:Event):void{
			/*trace("replay the game");*/
			t=0;absv=3;score=0;
			removeChild(p);removeChild(p.aS);
			p=new PContainer();
			for(var i:int=0;i<3;i++){
				removeChild(m[i]);
				m[i]=new MContainer(i);
				addChild(m[i]);
			}
			addChild(p);addChild(p.aS);
			removeChild(text1);removeChild(replay);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN,p.changeMove);
			this.addEventListener(Event.ENTER_FRAME,reflesh);
		}
		/*function testKeyboard(evt:KeyboardEvent){
			trace(evt.charCode);
		}*/
	}
}
