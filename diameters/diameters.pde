/** Diameter Cycle
*  Moves a series of circles across the screen.
*/


float[] diams;
float[] centers;
int numCircles;
float dt = 0.1;
float easing = 0.05;
float a = 0;

void setup(){
  size(600,600);
  numCircles = 6;
  diams = new float[numCircles];
  centers = new float[numCircles];
  for(int i=0;i < numCircles;i++){
    
    //The first circle will have radius 0, and expands to full size
    //as the last circle shrinks.
    if(i == 0){
      diams[i] = 0;
      centers[i] = 0;
    }else{
      diams[i] = width / (numCircles-1);
      centers[i] = centers[i-1] + (diams[i] + diams[i-1]) / 2; 
    }
  }
  
}

void draw(){
  background(5,8,131);
  translate(0,height/2);
  noStroke();
  fill(7,7,184);
  float dmove = 20 * dt * (sin(a)+1);
  moveMembers(dmove);
  displayMembers();
  a += easing * dt;
}

void moveMembers(float incr){
  int lasti = numCircles - 1;
  float tempDiam = diams[lasti] - incr;
  if(tempDiam <= 0){
    for(int i=lasti;i > 0;i--){
      diams[i] = diams[i-1];
      centers[i] = centers[i-1];
    }
    diams[0] = incr;
    centers[0] = 0;
  }else{
    diams[lasti] = tempDiam;
    diams[0] += incr;
  }
  
  //update centers
  for(int i=0;i < numCircles;i++){
    if(i == 0){
      centers[i] = diams[0] / 2;
    }else{
      centers[i] = centers[i-1] + (diams[i] + diams[i-1]) / 2;
    }
    
  }
  
}

void displayMembers(){
  for(int i=0;i < numCircles; i++){
    ellipse(centers[i],0,diams[i],diams[i]);
  }
  
}