class Object {
  PVector pos;
  float r;
  
  Object(float x, float y, float z, float radius){
    pos =  new PVector(x, y ,z);
    r = radius;
  }
  
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(255);
    sphere(r);
    popMatrix();
  }
  
  
}