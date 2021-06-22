/* Easing rotational motion */
//TODO: fix Bar.isHeld function so that clicking any place
// on the bar counts as isHeld. the rotational part is the tough
// aspect.
float easing = 0.10;
float time_step = 0.05;
float slow_down = 0.02;
float objAngle = 0.0;
float da = 0.0;

Bar spinner;

void setup(){
  size(400,400);
  background(200,150,200);
  spinner = new Bar(width/2,height/2,160,40,slow_down);
  cursor(CROSS);
}

void draw(){
  background(200,150,200);
  //TODO: add isheld condition once fixed
  PVector mouse_v = new PVector(mouseX,mouseY);
  if(mousePressed){ //<>//
    float pull_ang = atan2(mouseY-pmouseY,mouseX-pmouseX);
    da = easing * (pull_ang);
  }else{
    da -= slow_down * da;
  }
  objAngle = objAngle + da;
  
  translate(spinner.center.x,spinner.center.y);
  spinner.setAngle(objAngle); //<>//
  spinner.display(0,0);
  
}