Stroke s1 = new Stroke(0, 0, 0, 100, 40, 40, 100);
Stroke s2 = new Stroke(0, 0, 0, 40, 100, 40, 100);

void setup() {
  size(600, 600, P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  camera(
    0.0, -120.0, 200.0, 
    0.0, 0.0, 0.0, 
    0.0, 1.0, 0.0);
  
  fill(255, 0, 0);
  s1.draw();
  fill(0, 255, 255);
  s2.draw();
}