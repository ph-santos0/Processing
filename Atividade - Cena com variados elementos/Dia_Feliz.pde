int sol = 100;
int lua = -70;
int noite = 0;
int grama = 180;
int ceu = 225;
int nuvem = 250;
int estrelas = -150;
float angle = 0;

void setup(){
  size(800,600);
}

void draw(){
  background(150, 225, 255);
  noStroke();
  fill (0,0,0, noite);
  rect(0, 0, 800, 600);
  fill(255, 255, 255, estrelas);
  noStroke();
  ellipse (250, 80, 5, 5);
  ellipse (680, 170, 5, 5);
  ellipse (650, 100, 5, 5);
  ellipse (600, 250, 5, 5);
  ellipse (320, 120, 5, 5);
  ellipse (700, 280, 5, 5);
  ellipse (380, 220, 5, 5);
  ellipse (500, 240, 5, 5);
  ellipse (280, 260, 5, 5);
  ellipse (760, 170, 5, 5);
  fill(nuvem, nuvem, nuvem);
  circle(450, 120, 80);
  fill(nuvem, nuvem, nuvem);
  circle(500, 120, 100);
  fill(nuvem, nuvem, nuvem);
  circle(550, 120, 80);
  fill(250, 250, 0);
  circle(150, sol, 140);
  fill(250, 250, 250);
  circle(150, lua, 140);
  fill(15, 22, 25);
  circle(175, lua, 130);
  fill(0, grama, 0);
  ellipse(250, 500,1500, 300);

  translate(600, 330);
  // Incrementa o ângulo de rotação das pás
  angle += 0.04;
  
  // Desenha a base fina
  stroke(0);
  strokeWeight(4);
  line(0, 120, 0, 0);

  for (int i = 0; i < 4; i++) {
    float bladeAngle = TWO_PI / 4 * i + angle;
    pushMatrix();
    rotate(bladeAngle);
    // Define cores diferentes para cada pá
    if (i == 0) {
      fill(255, 0, 0); // Vermelho
    } else if (i == 1) {
      fill(0, 255, 0); // Verde
    } else if (i == 2) {
      fill(0, 0, 255); // Azul
    } else {
      fill(255, 255, 0); // Amarelo
    }
    // Desenha a pá como um triângulo
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(40, 40);
    vertex(40, 0);
    endShape(CLOSE);

    popMatrix();
  }
  // Desenha uma bolinha branca no centro das pás
  fill(255);
  ellipse(0, 0, 10, 10);

  if (sol < 450){
    sol += 1;

    if(sol == 450){
      lua = -70;
    }
  }

  if (sol > 320 && noite < 230){
    noite +=2;
    estrelas +=2;
    grama -=1;
    nuvem -=1;
  }

  if (sol == 450 && lua < 450){
    lua += 1;
    
    if(lua == 450){
      sol = -70;
    }
  }

  if (sol < 60){
    noite -=2;
    estrelas -=2;
    grama +=1;
    nuvem +=1;
  }
}
