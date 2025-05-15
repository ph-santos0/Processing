Desenho1 desenho1;
Desenho2 desenho2;
Desenho3 desenho3;
Desenho4 desenho4;
int currentDesenho = 1;

void setup() {
  size(800, 600);
  desenho1 = new Desenho1();
  desenho2 = new Desenho2();
  desenho3 = new Desenho3();
  desenho4 = new Desenho4();
}

void draw() {
  background(255);

  switch (currentDesenho) {
    case 1:
      desenho1.display();
      break;
    case 2:
      desenho2.display();
      break;
    case 3:
      desenho3.display();
      break;
    case 4:
      desenho4.display();
      break;
  }
}

void keyPressed() {
  if (key == '1') {
    currentDesenho = 1;
  } else if (key == '2') {
    currentDesenho = 2;
  } else if (key == '3') {
    currentDesenho = 3;
  } else if (key == '4') {
    currentDesenho = 4;
  }
}
