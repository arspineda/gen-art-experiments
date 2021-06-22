final int ROWS = 200;
final int COLS = 200;

float diam;
void setup(){
 size(1000,1000);
 background(255);
 diam = 0.40 * width;
 noStroke();
 colorMode(HSB);
 rectMode(CORNER);
 noLoop();
}

void draw(){

 fill(0);
 ellipse(width/2,height/2,diam,diam);

 float tile_len = width / COLS;
 float tile_ht = height / ROWS;
 
 for(int i=0;i < COLS;i++){
   for(int j=0; j < ROWS;j++){
     float x = i*tile_len;
     float y = j*tile_ht;
     float wt = 255 - val(x-width/2,y-height/2);
     fill( 170 , 255, wt, wt);
     rect(x,y,tile_len,tile_ht);
     
   }
   
 }
 fill(0);
 ellipse(width/2,height/2,diam/2,diam/2);
 //saveFrame("polar-eye.png");
}

float val(float x, float y){
  return (x*x + y*y)/( width/2);
}