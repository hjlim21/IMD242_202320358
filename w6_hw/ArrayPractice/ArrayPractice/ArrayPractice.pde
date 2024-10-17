int[] fruitAmts;
String[] fruitNames = {"apple",
  "orange",
  "banana",
  "kiwi",
  "peach",
  "plum"};

color[] barColors = {
  color(255, 180, 180),
  color(255, 205, 180),
  color(255, 255, 180),
  color(205, 255, 180),
  color(255, 180, 205),
  color(205, 180, 255)
};

float barGap;
float barWidth;
float x;

int total = 0;
float average = 0;

void setup() {
  size(1280, 720);

  barGap = width / (fruitNames.length + 2);
  barWidth = barGap * 0.3;
  x = barGap;

  float totalGraphWidth = barGap * (fruitNames.length - 1);
  x = (width - totalGraphWidth) / 2;

  fruitAmts = new int[fruitNames.length];

  for (int n = 0; n < fruitAmts.length; n++) {
    if (n == 0) {
      fruitAmts[n] = 50;
    } else {
      fruitAmts[n] = int(random(5, 100));
    }
    total += fruitAmts[n];
  }

  average = total / (float)fruitAmts.length;
}

void draw() {
  background(0);
  strokeWeight(barWidth);

  for (int n = 0; n < fruitNames.length; n++) {
    stroke(barColors[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(20);
    fill(255);

    line(x + barGap * n, height * 0.5,
      x + barGap * n, height * 0.5 - 2 * fruitAmts[n]);
    text(fruitNames[n], x + barGap * n,
      height * 0.5 + height * 0.05);
    text(fruitAmts[n], x + barGap * n,
      height * 0.5 - 2 * fruitAmts[n] - height * 0.05);
  }

  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Total: " + total, width/2, height - 140);
  text("Average: " + nf(average, 1, 2), width/2, height - 100);
}
