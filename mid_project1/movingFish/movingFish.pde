ArrayList<Fish> fishes = new ArrayList<Fish>();
// true: 물고기 모임 , false: 흩어짐
boolean mouseAttract = true;
int maxFishCount = 10;


void setup() {
  fullScreen();
  // 물고기 100마리 랜덤으로 풀어주기
  for (int i = 0; i < 100; i++) {
    fishes.add(new Fish(random(width), random(height)));
  }
}

void draw() {
  background(200, 230, 255);

  int countFish = 0;
  for (Fish fish : fishes) {
    if (fish.isVisible()) { 
      fish.move(fishes);      // 물고기 이동
      fish.display();         // 물고기 그리기
      countFish++;            // 물고기 수 카운트
    }
  }

  // 좌측 상단에 물고기 수 표시
  fill(0);
  textSize(16);
  text("Array list Fish: " + countFish, 10, 20);
}

// 마우스 클릭 시 물고기 흩어지고 모임
void mousePressed() {
  mouseAttract = !mouseAttract;
  fishes.add(new Fish(mouseX, mouseY));
}
