
int rect=3;
float [] xrr = new float[rect];
float [] yrr = new float[rect];
float [] ballx = new float[rect];
float [] bally = new float[rect];
boolean [] keys;
float foodx;
float foody;
int score =-1;
float radius=50;
float speed=2;
int flag=1;
int flag2=0;
int flag3=0;
int j=0;

void setup(){
  size(600,600);
  background(0);
  frameRate(60);
  
  for(int i=0;i<rect;i++) {
    xrr[i]=400+300*i;
    yrr[i]=random(200,height-300);
    ballx[i]=xrr[i]+50;
    bally[i]=yrr[i]-radius/2;
  }
  
  keys = new boolean[128];
}

void draw() {
  background(0);
  move();
  if(flag3==0) {
    flag3=1;
    score+=1;
    foodx=random(300,500);
    foody=random(70,150);
  }
  
  textSize(25);
  fill(0, 50, 255);
  text("Score : " + score, 40, 60);    //score display
  
  stroke(255);
  fill(0,200,0);
  ellipse(foodx,foody,20,20);
  if(flag2==1) {
    if(bally[j]> 20+radius && flag==1){
    bally[j]-=0.01*(0.005*(ballx[j]-xrr[j])*(ballx[j]-xrr[j])-0.098*(ballx[j]-xrr[j]));
    }
    else{
    bally[j]+=0.01*(0.005*(ballx[j]-xrr[j])*(ballx[j]-xrr[j])+0.098*(ballx[j]-xrr[j]));
    flag=0;
    }
    ballx[j]+=3;
  }
  if(foodx>=ballx[j]-20 && foodx<=ballx[j]+20 && foody>=bally[j]-20 && foody<=bally[j]+20){
    flag3=0;
  }
  stroke(255);
  fill(100,0,0);
  ellipse(ballx[j],bally[j],radius,radius);
  fill(100,100,100);
  for(int i=0;i<rect;i++) {
    rect(xrr[i],yrr[i],150,40);
    xrr[i]-=speed;
    if(i==j) {
      ballx[j]-=speed;
    }
    if(xrr[i]<-200) {
      xrr[i]=width+100;
      yrr[i]=random(200,height-200);
    }
    if(flag2==1) {
    if(ballx[j]>=xrr[i] && ballx[j]<=xrr[i]+150 && bally[j]>=yrr[i]-radius/2 && bally[j]<=yrr[i]+radius/2){
      ballx[i]=ballx[j];
      bally[i]=bally[j]-5;
      flag2=0;
      flag=1;
      j=i;
      
    }
    }
    if((ballx[j]<xrr[j] || ballx[j]>xrr[j]+150 || bally[j]>yrr[j]) && flag2==0) {
      bally[j]+=3;   //ball going down the frame
      score=0;
    }
    if(bally[j]>height+100) {
      ballx[j]=xrr[j]+50;
      bally[j]=yrr[j]-radius/2;
    }
  }
  
}

void move() {

  if (keys['w']){
    flag2=1;
     
  }
  if (keys['s'])
    bally[j]+=2*ballx[j]*ballx[j]-4*ballx[j];
  if (keys['a'])
    ballx[j]--;
  if (keys['d'])
    ballx[j]++;

}

void keyPressed() {
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}
  