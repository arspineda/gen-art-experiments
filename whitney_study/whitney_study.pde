/**Whitney Study
*  Sketch following a tutorial by Alexander Miller,
*  "Recreating Vintage Computer Art with Processing".
*/

static final int NUM_LINES = 10;
float t;

void setup(){
  size(400,400);
  background(20);
  t = 0;
}

void draw(){
 stroke(200,0,255);
 strokeWeight(5);
 
 translate(width/2,height/2);
 background(13);
 for (int i = 0; i < NUM_LINES; i++){
   line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
 }
 t += 0.5;
  
}

float x1(float t){
  return sin(t / 10) * 100 + sin(t/5) * 20;
}

float y1(float t){
  return cos(t / 10) * 100;
}

float x2(float t){
  return sin(t / 10) * 200 + sin(t) * 2; 
}

float y2(float t){
  return cos(t / 20) * 200 + cos(t / 12) * 20;
}