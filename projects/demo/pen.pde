class Pen{
  PVector pos;
  
  
  
  Pen(float x, float y, float z){
    pos =  new PVector(x, y ,z);
  
  }
  
  void draw() {
    pushMatrix();
    fill(255);
    noStroke();
    translate(pos.x, pos.y, pos.z);
    box(5);
    popMatrix();
    
    helperPlane();
  }
  
  void helperPlane() {
    PVector eye = new PVector(0, 0, -1);
    PVector up = new PVector(0, -1, 0);
    
    horizontalPlane(eye, up);
    verticalPlane(eye, up);
  }
  
  // keyboard control distance and direction
  void keyControl() {
    switch(key) {
      case 'w':
        this.pos.z += 1;
        break;
      case 's':
        this.pos.z -= 1;
        break;
      case 'a':
        this.pos.x -= 1;
        break;
      case 'd':
        this.pos.x += 1;
        break;
      case 'q':
        this.pos.y -= 1;
        break;
      case 'e':
        this.pos.y += 1;
        break;
    }
  }
  
  // ------------- plane calculation ---------------
  void verticalPlane(PVector eye, PVector up) {
    float d = 75.0;
    int numDiv = 50;
    float div = d/numDiv;
    
    PVector n = eye.cross(up);
    
    // plane bottom near point 
    PVector bottomNear = PVector.mult(up, -1 * d/2);
    
    // plane top near point
    PVector topNear = PVector.mult(up, d/2);
    
    // plane bottom far point
    PVector bottomFar = PVector.add(PVector.mult(eye, d), PVector.mult(up, -1 * d/2));
    
    // plane top far point
    PVector topFar = PVector.add(PVector.mult(eye, d), PVector.mult(up, d/2));
    
    
    // draw vertical plane ------
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noFill();
    stroke(0, 0, 255);
    beginShape(QUADS);
    for (int i = 0; i < numDiv; i++){
      for (int j = 0; j < numDiv; j++) {
        vertex(bottomFar.x, bottomFar.y - i*div, bottomFar.z + j*div);
        vertex(bottomFar.x, bottomFar.y - (i+1)*div, bottomFar.z + j*div);
        vertex(bottomFar.x, bottomFar.y - (i+1)*div, bottomFar.z + (j+1)*div);
        vertex(bottomFar.x, bottomFar.y - i*div, bottomFar.z + (j+1)*div);
      }
    }
    endShape();
    popMatrix(); 
    // -----------------------------
    
  }
  
  void horizontalPlane(PVector eye, PVector up) {
    float d = 75.0;
    int numDiv = 50;
    float div = d/numDiv;
    
    
    /*
    float[] pos = cam.position();
    PVector camPos = new PVector(pos[0], pos[1], pos[2]);*/
    PVector n = eye.cross(up);
    
    // plane left near point 
    PVector leftNear = PVector.mult(n, -1 * d/2);
    
    // plane right near point
    PVector rightNear = PVector.mult(n, d/2);
    
    // plane left far point
    PVector leftFar = PVector.add(PVector.mult(eye, d), PVector.mult(n, d/2));
    
    // plane right far point
    PVector rightFar = PVector.add(PVector.mult(eye, d), PVector.mult(n, d/2));
    
    /*
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(200);
    beginShape();
    vertex(leftFar.x, leftFar.y, leftFar.z);
        vertex(rightFar.x, rightFar.y, rightFar.z);
        vertex(rightNear.x, rightNear.y, rightNear.z);
        vertex(leftNear.x, leftNear.y, leftNear.z);
    endShape();
    popMatrix(); */
    
    // draw horizontal plane ------
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noFill();
    stroke(0, 0, 255);
    beginShape(QUADS);
    for (int i = 0; i < numDiv; i++){
      for (int j = 0; j < numDiv; j++) {
        vertex(leftFar.x + i*div, leftFar.y, leftFar.z + j*div);
        vertex(leftFar.x + (i+1)*div, leftFar.y, leftFar.z + j*div);
        vertex(leftFar.x + (i+1)*div, leftFar.y, leftFar.z + (j+1)*div);
        vertex(leftFar.x + i*div, leftFar.y, leftFar.z + (j+1)*div);
      }
    }
    endShape();
    popMatrix(); 
    // -----------------------------
    
  }
  
  void detectObject() {
    
  }
  
  void detectIntersection(Object obj, PVector penPos, PVector look) {
    float b = -2 * (look.x*(penPos.x - obj.pos.x) + look.y*(penPos.y - obj.pos.y) + look.z*(penPos.z - obj.pos.z));
    float a = look.magSq();
    float c = PVector.sub(penPos, obj.pos).magSq() - obj.r * obj.r;
    
    float delta = b*b - 4*a*c;
    
    if (delta > 0){
      float k1 = (-1/4 * b + sqrt(delta))/(a*c);
      float k2 = (-1/4 * b - sqrt(delta))/(a*c);
      
      PVector p1 = PVector penPos.;
    }else if (delta == 0) {
      
    }
  }
  
}