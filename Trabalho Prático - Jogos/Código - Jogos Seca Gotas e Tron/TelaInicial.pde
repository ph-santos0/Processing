import processing.sound.*;

Secagota secagota;
Trongame trongame;

// Tela Inicial

int telaAtual = 0; // 0 - Tela Inicial, 1 - Seca Gotas, 2 - Tron
SoundFile pingo;
SoundFile tromOST;

void setup() {
  secagota = new Secagota();
  trongame = new Trongame();

  secagota.setup();
  trongame.setup();

  fullScreen();
  background(50, 100, 150);

  pingo = new SoundFile(this, "som/pingo.mp3");
  tromOST = new SoundFile(this, "som/trom_ost.mp3");
}

void draw() {

  if (telaAtual == 0) {
    tromOST.stop();
    background(50, 100, 150);
    textSize(64);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Tela Inicial", width / 2, height / 2 - 100);
    textSize(32);
    text("Pressione 1 para Seca Gotas", width / 2, height / 2);
    text("Pressione 2 para Tron", width / 2, height / 2 + 50);
  }

  if (telaAtual == 1) {
    secagota.draw();
  } else if (telaAtual == 2) {
    trongame.draw();
    if(!tromOST.isPlaying()) tromOST.loop();
  }
}

void keyPressed() {
  if (telaAtual == 0) {
    if (key == '1') {
      telaAtual = 1; // Vai para o jogo Seca Gotas
    } else if (key == '2') {
      telaAtual = 2; // Vai para o jogo Tron
    }
  } else {
    // Código de controle para reiniciar ou sair dos jogos
    if (key == 'r' || key == 'R') {
      if (telaAtual == 1) {
      } else if (telaAtual == 2) {
      }
    } else if (key == ESC) {
      key = 0; // Previne que ESC feche o programa
      if (telaAtual == 1 || telaAtual == 2) {
        // Volta para a tela inicial ao pressionar ESC durante o jogo
        telaAtual = 0;  
      }
    }
  }
  if (telaAtual == 1) {
    secagota.keyPressed(keyCode);
  }
  if (telaAtual == 2) {
    trongame.keyPressed(keyCode);
  }
}
