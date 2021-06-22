/**Squareshift
 * Experimenting with multiple objects moving.
 * Press space to reset, and r to start/stop recording.
 */

float ANGLE;
final float INCR = 40;
float diag;
boolean recordMode = false;

int num_sqrs;
float[] squares;
float[] targets;

void setup(){
  size(640,400);
  background(25);
  rectMode(CENTER);
  fill(255,200);
  noStroke();
  frameRate(30);
  ANGLE = atan2(width,height);
  diag = height/(2*cos(ANGLE));
  num_sqrs = floor(2*diag/INCR)+1;
  squares = new float[num_sqrs];
  targets = new float[num_sqrs];
  for(int i=0;i < num_sqrs;i++){
    squares[i] = 0;
    targets[i] = 0;
  }
}

void draw(){
  background(25);
  translate(width/2,height/2);
  rotate(ANGLE); //rotates y axis to diagonal
  scale(1);
  for(int i=0;i < num_sqrs;i++){
    float dx = targets[i] - squares[i];
    squares[i] = squares[i] + 0.05 * dx;
    fill(255,200);
    rect(squares[i],-diag+INCR*i,40,40);
  }
  if(recordMode == true && millis() % 30 < 10){//approx 30 frame/sec capture
    saveFrame("squareshift-####.png");
  }
}

void mouseClicked(){
  for(int i=0;i < num_sqrs;i++){
    targets[i] = squares[i] + random(80) - 40; 
  }
}

void keyPressed(){
 if(key == ' '){
   for(int i=0; i < num_sqrs;i++){
     targets[i] = 0;
   }
 }
 if(key == 'r'){
   if(recordMode == false){
     println("Recording");
     recordMode = true;
   }else{
     println("Recording stopped");
     recordMode = false;
   }
 }
 
}