class Stroke {
  PVector pos;
  int num_particles;
  float w; // width 
  float d; // depth
  float h; // height
  
  
  Stroke(float x, float y, float z, float wid, float dep, float hei, int n) {
    pos = new PVector(x, y, z);
    w= wid;
    d = dep;
    h = hei;
    num_particles = n;
    
  }
  
  // draw
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(w, h, d);
    popMatrix();
  }
  
  // ----------- mutator -----------
  void setX(float x){
    pos.x = x;
  }
  
  void setY(float y) {
    pos.y = y;
  }
  
  void setZ(float z) {
    pos.z = z;
  }
  
  void setPos(PVector p) {
    pos = p;
  }  
  
  //---------------accessor--------------
  PVector getPos() {
    return pos;
  }
  
  float getX(){
    return pos.x;
  }
  
  float getY() {
    return pos.y;
  }
  
  float getZ() {
    return pos.z;
  }
  
  float getWidth() {
    return w;
  }
  
  float getDepth() {
    return d;
  }
  
  float getHeight() {
    return h;
  }
  
  int getNumParticles() {
    return num_particles;
  }
}