/** Color Modulo
* A grid of six colors, rearranged according to the integers mod 7.
* Press 's' to save the frame, and 'z' to cycle the colors.
*/
//NOTE: The sketch doesn't work for certain numbers (e.g. 7 or 20),
//while 6 and 10 do. may be an off by one error. corresponds to when
// the number choice PLUS 1 is not prime!

import java.lang.String;

boolean switchMode;

final int NUM_COLS = 10; //numbers calculated mod num_cols PLUS 1.
color[] colors = new color[NUM_COLS];
float side_ln;

void setup(){
 colorMode(HSB);
 size(600,600);
 noStroke();
 side_ln = width / NUM_COLS;
 for(int i=0;i < NUM_COLS;i++){
   colors[i] = color(i*20,255,255);
 }
 switchMode = false;
}

void draw(){
  if(switchMode){
    for(int i=0;i < NUM_COLS;i++){
      float hue = (hue(colors[i]) + 5) % 255;
      colors[i] = color(hue,255,255);
    }
    switchMode = false;
  }
  
  for(int i=0;i < NUM_COLS;i++){
    for(int j=0;j < NUM_COLS;j++){
      
      //The modulo logic here determines all the arrangements.
      //The array hasn't been properly defined for 0 mod n tho.
      
      int choice = ( (i+1)*(j+1) ) % (NUM_COLS + 1);
      fill(colors[choice-1]);
      rect(i*side_ln,j*side_ln,side_ln,side_ln);
    }
  }
  
}

void keyPressed(){
  if(key == 's'){
    saveFrame("Color_mod_" + String.valueOf(NUM_COLS+1) + "_###.png");
  }
  else if(key == 'z'){
    switchMode = true;
  }
}