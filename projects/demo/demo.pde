import damkjer.ocd.*;

Camera cam;
Pen pen;
Object obj;

void setup() {
  size(600, 600, P3D);
  background(0);
  
  // camera setting up
  cam = new Camera(this, 100);
  
  // init pen and objects
  pen = new Pen(0, 0, 50);
  obj = new Object(0, 0, 0, 22);
}

void draw() {
  background(0);
  lights();
  
  cam.feed();
  
  // camera control
  objectRotate();
  //rotateY(PI/3);
  
  if (keyPressed == true) {
    pen.keyControl();
  }
  
  
  //===========================================================
  float[] eye = cam.target();
  float[] pos = cam.position();
  float[] lookup = cam.up();
  
  PVector look = new PVector(eye[0] - pos[0], eye[1] - pos[1], eye[2] - pos[2]);
  look.normalize();
  
  PVector up = new PVector(lookup[0], lookup[1], lookup[2]);
  up.normalize();
    
  //print("look: ", look);
  //println();
  //print("up: ", up);
  //println();
  //=============================================================
  
  // draw pen
  pen.draw();
  
  // draw object
  obj.draw();
}



// right mouse control
void objectRotate() {
  if (mousePressed && (mouseButton == RIGHT)) {
    cam.tumble(radians(pmouseX - mouseX)/2, radians(pmouseY - mouseY)/2);
  }
}

// keyboard control distance and direction
void keyControl() {
  switch(key) {
    case 'w':
      cam.dolly(-5);
      break;
    case 's':
      cam.dolly(5);
      break;
    case 'a':
      cam.truck(-5);
      break;
    case 'd':
      cam.truck(5);
      break;
  }
}