void setup() {
  size(640, 480);
}

void draw() {
  background(216, 252, 255);
  strokeWeight(3);
  
  
  // 귀
  fill(255);
  ellipse(mouseX - 40, mouseY - 80, 60, 150);
  ellipse(mouseX + 40, mouseY - 80, 60, 150);
   
  fill(mouseX/2, 0, mouseY/2);
  ellipse(mouseX - 50, mouseY - 80, 40, 100);
  ellipse(mouseX + 50, mouseY - 80, 40, 100);

  // 머리
  fill(255);
  ellipse(mouseX, mouseY, 160, 170);

  // 눈
  fill(0);
  ellipse(mouseX - 20, mouseY - 10, 15, 15);
  ellipse(mouseX + 20, mouseY - 10, 15, 15);

  // 볼
  fill(255, 230, 230);
  ellipse(mouseX - 40, mouseY + 30, 30, 20);
  ellipse(mouseX + 40, mouseY + 30, 30, 20);

  // 코
  fill(255, 50, 50);
  ellipse(mouseX, mouseY + 10, 20, 15);
  
  // 입
  line(mouseX, mouseY + 20, mouseX, mouseY + 30);
  line(mouseX, mouseY + 30, mouseX - 10, mouseY + 40);
  line(mouseX, mouseY + 30, mouseX + 10, mouseY + 40);
}
