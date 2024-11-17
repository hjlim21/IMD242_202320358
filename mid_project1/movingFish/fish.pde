class Fish {
  float x, y;  //물고기 위치 
  float vx, vy;  //물고기 속도 
  float maxSpeed = 3;  //물고기가 너무 빠르게 움직이지 않도록 최대속도 설정 
  float maxForce = 0.1;  //물고기 최대 가속도 설정 
  color fishColor;

  //물고기의 초기 위치, 속도, 색상 설정
  Fish(float startX, float startY) {
    x = startX;
    y = startY;
    vx = random(-10, 10);  //물고기 속도를 -10~10 중 무작위로 설정 
    vy = random(-10, 10);
    fishColor = color(random(150, 255), random(150, 255), random(150, 255));
  }

  //물고기 이동과 다른 물고기와의 상호작용을 설정 
  void move(ArrayList<Fish> fishes) {
    float[] follow = follow(fishes);  //물고기들 같은 방향으로 헤엄
    float[] gether = gether(fishes);   //물고기들 서로 가까이 붙음
    float[] avoid = avoid(fishes);   //물고기들 떨어져서 헤엄
    float[] mouseInteraction = mouseEffect();   //물고기들이 마우스에 반응해 흩어지고 모임 

    //물고기 속도와 방향을 정함
    vx += follow[0] + gether[0] +
      avoid[0] + mouseInteraction[0];
    vy += follow[1] + gether[1] +
      avoid[1] + mouseInteraction[1];

    // AI의 도움을 받아 작성된 코드입니다
    // 물고기가 화면에서 움직이도록 코드 작성 부탁함
    // 속도제한
    float speed = sqrt(vx * vx + vy * vy);
    if (speed > maxSpeed) {
      vx = (vx / speed) * maxSpeed; //최대속도를 넘지않도록 속도 조정 
      vy = (vy / speed) * maxSpeed;
    }

    //물고기의 위치를 계산해 움직이도록 함 
    x += vx; 
    y += vy;

    // 화면경계설정
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  // AI의 도움을 받아 작성된 코드입니다
  // 주변 물고기에 영향을 받아 서로 달라붙지 않는 코드작성을 부탁함
  // 물고기가 주변 물고기들과 같은 방향으로 이동하도록 함
  float[] follow(ArrayList<Fish> fishes) {
    float perceptionRad = 50;  //주변 물고기들을 인식하는 반경
    float Vx = 0, Vy = 0;  //주변 물고기들의 속도
    int total = 0;  //주변 물고기 수

    for (Fish other : fishes) {
      float d = dist(x, y, other.x, other.y);  //물고기 간 거리를 계산해 변수에 저장 
      if (other != this && d < perceptionRad) {  
        Vx += other.vx;
        Vy += other.vy;
        total++;
      }
    }

    if (total > 0) {
      Vx /= total;  //평균속도계산
      Vy /= total;
      Vx = (Vx - vx) * maxForce;  //물고기가 평균속도에 가깝도록 방향조정
      Vy = (Vy - vy) * maxForce;
      return new float[]{Vx, Vy};
    }
    return new float[]{0, 0};
  }

  //물고기 중심점을 계산함
  float[] gether(ArrayList<Fish> fishes) {
    float perceptionRad = 50;  //주변 물고기를 인식하는 반경
    float centerX = 0, centerY = 0;  //주변 물고기들 위치 계산
    int total = 0;

    //모든 물고기에게 반복
    for (Fish other : fishes) {
      float d = dist(x, y, other.x, other.y);  //물고기와 다른 물고기 사이 거리 계산
      if (other != this && d < perceptionRad)
      {
        centerX += other.x;
        centerY += other.y;
        total++;
      }
    }
    return new float[]{0, 0};
  }

  //너무 가까운 물고기와는 떨어지도록 함
  float[] avoid(ArrayList<Fish> fishes) {
    float perceptionRad = 50;  //물고기 인식하는 반경
    float adjustX = 0, adjustY = 0;  //멀어지는 방향
    int total = 0;

    //모든 물고기에게 반복
    for (Fish other : fishes) {
      float d = dist(x, y, other.x, other.y);  //물고기와 다른 물고기 사이 거리 계산

      if (other != this && d < perceptionRad) {
        float gapX = x - other.x;  //다른 물고기와 x방향 거리 차이 
        float gapY = y - other.y;  //다른 물고기와 y방향 거리 차이 
        total++;
      }
    }
    
      return new float[]{0, 0};
  }
  
  //AI의 도움을 받아 작성된 코드입니다 
  //마우스를 클릭하면 물고기들이 모이고 다시 클릭하면 흩어지는 코드 작성을 부탁함
  //마우스 위치에 따라 물고기들이 모이거나 흩어지게 함
  float[] mouseEffect() {
    float adjustX = 0, adjustY = 0;
    float d = dist(x, y, mouseX, mouseY);  //마우스와 물고기 간 거리

    if (d < 100) {
      if (mouseAttract) {
        adjustX = (mouseX - x) * maxForce;  //물고기가 마우스 위치로 모이도록 함
        adjustY = (mouseY - y) * maxForce;
      } else {
        adjustX = (x - mouseX) * maxForce;  //물고기가 마우스 위치로부터 흩어지도록 함
        adjustY = (y - mouseY) * maxForce;
      }
      return new float[]{adjustX, adjustY};
    }
    return new float[]{0, 0};
  }

  void display() {
    float angle = atan2(vy, vx) + PI / 2;  //물고기 몸체 회전각도 계산
    fill(fishColor);
    stroke(0);
    pushMatrix();
    translate(x, y);
    rotate(angle);

    //물고기 몸체
    ellipse(0, 0, 20, 10);

    //물고기 꼬리
    pushMatrix();
    translate(15, 0);
    triangle(0, -5, -5, 0, 0, 5);
    popMatrix();
    popMatrix();
  }

  //왼쪽 상단 arraylist 숫자
  boolean isVisible() {
    return (x >= 0 && x <= width && y >= 0 && y <= height);
  }
}
