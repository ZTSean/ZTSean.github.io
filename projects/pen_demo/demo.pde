import damkjer.ocd.*;

Camera cam;
Pen pen;
Object obj;

void setup() {
  size(800, 800, P3D);
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
    keyControl();
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
  pen.draw(obj);
  
  // draw object
  obj.draw();
}

//================================ instruction text ========================================
void instruction() {
  fill(255);
  textSize(64);
  text("Instruction: ", 2, 2);
}


//=================================== control ===============================================
// right mouse control
void objectRotate() {
  if (mousePressed && (mouseButton == RIGHT)) {
    cam.tumble(radians(pmouseX - mouseX)/2, radians(pmouseY - mouseY)/2);
  }else if (mousePressed && (mouseButton == LEFT)) {
    cam.truck((pmouseX - mouseX)/4);
    cam.boom((pmouseY - mouseY)/4);
  }
}

// keyboard control distance and direction
void keyControl() {
  switch(key) {
    case 'z':
      cam.dolly(-5);
      break;
    case 'c':
      cam.dolly(5);
      break;
  }
}

void keyPressed() {
  switch(key) {
    case 'l':
        pen.turnLineOn = !(pen.turnLineOn);
        break;
      case 'p':
        pen.turnPlaneOn = !(pen.turnPlaneOn);
        break;
  }
}