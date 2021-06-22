public class Bar{
  PVector center;
  float angle;
  float frict;
  float bar_length;
  float bar_width;
  
  Bar(float x, float y, float ln, float wd, float fr){
    angle = 0.0;
    center = new PVector(x,y);
    frict = fr;
    bar_length = ln;
    bar_width = wd;
  }
  
  void setAngle(float an){
    angle = an;
  }
  
  //determines if the bar is touched by some other
  //object (like the mouse) in terms of true coordinates
  boolean isHeld(PVector other){
    PVector net_v = PVector.sub(other,center);
    PVector bar_axis = PVector.fromAngle(objAngle);
    float max_angle = atan2(bar_width/2,other.x-center.x);
    float axis_angle = (objAngle - PVector.angleBetween(net_v,bar_axis) )% PI;
    return (net_v.mag() <= bar_length/2) && ( abs(max_angle) - abs(axis_angle) < 0.25);
  }
  
  void display(float x,float y){
   pushStyle();
   pushMatrix();
   rectMode(CENTER);
   rotate(angle);
   
   fill(255);
   noStroke();
   rect(x,y,bar_length,bar_width);
   
   textAlign(CENTER);
   textSize(20);
   fill(0);
   text('N',bar_length/2-10,bar_width/2);
   popStyle();
   popMatrix();
  }
  
}