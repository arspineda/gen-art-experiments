//In progress. Should I store diameters or positions? Both?
public class DiameterPack {
  float packWidth;
  float packCenter;
  int numShapes;
  float[] shapeDiams;
  
  DiameterPack(float wd, float c, int num){
    
    packWidth = wd;
    packCenter = c;
    numShapes = num;
    shapeDiams = new float[numShapes];
    for(int i=0;i < numShapes;i++){
      shapeDiams[i] = packWidth / numShapes;
    }
    
  }
  
  //movePack moves the chain of shapes rightward, while shrinking the rightmost member
  //and growing the leftmost. If the rightmost reaches negative size, it is removed,
  //and a new shape is placed in the leftmost spot.
  
  void movePack(float incr){
    float newDiam = shapeDiams[numShapes-1] - incr;
    if(newDiam < 0){
      
    }
  }
}