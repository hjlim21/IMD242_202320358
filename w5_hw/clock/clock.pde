int centerX, centerY;
int clockRadius = 300;

void setup() {
  size(800, 800);
  centerX = width / 2;
  centerY = height / 2;
}

void draw() {
  background(225);
  translate(centerX, centerY);

  float s = second();
  float m = minute();
  float h = hour();

  stroke(0);
  strokeWeight(5);
  fill(255);
  circle(0, 0, 600);

  for (int idx = 0; idx < 60; idx++) {
    float angle = 360 / 60 * idx;
    float xa = (clockRadius - 20);
    float xb = (clockRadius - 7);
    float ya = 0;
    float yb = 0;

    if (idx % 5 == 0) {
      strokeWeight(7);
      stroke(0);
    } else {
      strokeWeight(3);
      stroke(0);
    }

    pushMatrix();
    rotate(radians(angle));
    line(xa, ya, xb, yb);
    popMatrix();
  }

  // 시침
  strokeWeight(8);
  float hourAngle = (360/ 12) * h -90;
  pushMatrix();
  rotate(radians(hourAngle));
  line(0, 0, 200, 0);
  popMatrix();

  // 분침
  strokeWeight(5);
  float minuteAngle = (360 / 60) * m -90;
  pushMatrix();
  rotate(radians(minuteAngle));
  line(0, 0, 250, 0);
  popMatrix();

  // 초침
  strokeWeight(2);
  stroke(255, 0, 0);
  float secondAngle = (360 / 60) * s -90;
  pushMatrix();
  rotate(radians(secondAngle));
  line(0, 0, 250, 0);
  popMatrix();
  
  fill(255, 0, 0);
  circle(0, 0, 10);
}
