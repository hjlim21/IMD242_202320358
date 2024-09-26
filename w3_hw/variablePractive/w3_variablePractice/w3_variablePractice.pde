float x = random(width);
float y = random(height);
float r = random(50);
float g = random(180);
float b = random(170);


void setup() {
  size(1280, 720);
  background(0);
}

void mousePressed() {
  background(0);
}


void draw() {
  x = random(width);
  y = random(height);
  r = random(50);
  g = random(180);
  b = random(170);
  strokeWeight(random(0.5, 2));
  stroke(r, g, b);
  line(0, 720, x, y);
}
