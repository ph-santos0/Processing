class Elipse {
  float px;
  float py;
  color cor;
  float tamanho;
  float speedX;
  float speedY;
  
  Elipse(float x, float y, color c, float t, float sx, float sy){
    px = x;
    py = y;
    cor = c;
    tamanho = t;
    speedX = sx;
    speedY = sy;
  }  
}

int qtd;
int frame;
Elipse elipses[];

void setup(){
  size(800,600); 
  noStroke();
  frame = 0;
  qtd = 40;
  elipses = new Elipse[qtd];
  for(int i = 0; i < qtd; i++){
    float px = random(50, 750);
    float py = random(50, 550);
    float tamanho = random(10, 100);
    color cor = color(random(0,255), random(0,255), random(0,255), random(0,255));
    float speedX = random(-1, 1);
    float speedY = random(-1, 1);
    elipses[i] = new Elipse(px, py, cor, tamanho, speedX, speedY); 
  }
}

void draw(){  
  background(255);
  
  for(int i = 0; i < qtd; i++){
    fill(elipses[i].cor);
    ellipse(elipses[i].px, elipses[i].py, elipses[i].tamanho, elipses[i].tamanho);
    
    elipses[i].px += elipses[i].speedX;
    elipses[i].py += elipses[i].speedY;
    
    if (elipses[i].px < elipses[i].tamanho/2 || elipses[i].px > width - elipses[i].tamanho/2) {
      elipses[i].speedX *= -1;
      elipses[i].cor = color(random(0,255), random(0,255), random(0,255), random(0,255));
    }
    if (elipses[i].py < elipses[i].tamanho/2 || elipses[i].py > height - elipses[i].tamanho/2) {
      elipses[i].speedY *= -1;
      elipses[i].cor = color(random(0,255), random(0,255), random(0,255), random(0,255));
    }
  }
}
