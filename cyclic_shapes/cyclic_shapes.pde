/** Cyclic Shapes
*
*/
float t = 0.0;

void setup(){
  size(600,600);
  background(0);
  ellipseMode(CORNER);
  noFill();
}

void draw(){
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  
  noFill();
  strokeWeight(1);
  stroke(250,180);
  
 // ellipse(0,0,width,height);
 // ellipse(width/4,0,width/2,height/2);
  
  float r = width/2;
  translate(width/2,height/2);
  drawCyclicShape(r,0+t,PI/2+t,4*PI/3+t/3);
  drawCyclicShape(r,PI/3+t,PI/2+t,4*PI/3+t/3);
  drawCyclicShape(r,0+t,PI/3+t/3,PI/2+t);
 // drawCyclicShape(r,PI/4+t/2,3*PI/4+t,3*PI/2+t);
 
  t += 0.04;
}

void keyPressed(){
  if(key == 's'){
    saveFrame("cyclic_triangles.png");
  }
}
//drawCyclicShape: creates a triangle around the current origin.

void drawCyclicShape(float rad, float a1, float a2, float a3){
  
  PVector p1 = PVector.fromAngle(a1);
  p1.setMag(rad);
  PVector p2 = PVector.fromAngle(a2);
  p2.setMag(rad);
  PVector p3 = PVector.fromAngle(a3);
  p3.setMag(rad);
  
  beginShape(TRIANGLES);
  vertex(p1.x,p1.y);
  vertex(p2.x,p2.y);
  vertex(p3.x,p3.y);
  endShape();
}