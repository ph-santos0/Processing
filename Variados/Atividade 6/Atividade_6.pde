Desenho1 desenho1;
Desenho2 desenho2;
Desenho3 desenho3;
Desenho4 desenho4;
int contador = 0;
int framestroca = 60;

void setup() {
  size(800, 600);
  desenho1 = new Desenho1();
  desenho2 = new Desenho2();
  desenho3 = new Desenho3();
  desenho4 = new Desenho4();
}

void draw() {
  background(255);
  contador++;

  if (contador / framestroca % 4 == 0) {
    desenho1.display();
  } else if (contador / framestroca % 4 == 1) {
    desenho2.display();
  } else if (contador / framestroca % 4 == 2) {
    desenho3.display();
  } else if (contador / framestroca % 4 == 3) {
    desenho4.display();
  }
}
