import processing.sound.*;

class Secagota {
  Esponja esponja;
  Temporizador temporizador;
  Gota gotasDeChuva[] = new Gota[1000];
  int totalGotas = 0;
  int pontuacao = 0; // Variável para armazenar a pontuação
  boolean jogoAtivo = true; // Variável para verificar se o jogo está ativo

  void setup() {
    fullScreen();
    esponja = new Esponja(64, 40, 0, 0); // Inicialize a esponja com largura, altura e posição
    gotasDeChuva = new Gota[1000];
    temporizador = new Temporizador(300);
    temporizador.iniciarTemporizador();
  }

  void draw() {
    if (jogoAtivo) {
      background(255);
      esponja.posicaoX = mouseX;
      esponja.posicaoY = mouseY;
      esponja.exibirEsponja();

      // Exibe a pontuação na tela
      fill(0);
      textSize(32);
      textAlign(LEFT);
      text("Pontuação: " + pontuacao, 10, 30);

      if (temporizador.tempoFinalizado() == true) {
        gotasDeChuva[totalGotas] = new Gota();
        totalGotas++;
        if (totalGotas >= gotasDeChuva.length) {
          totalGotas = 0;
        }
        temporizador.iniciarTemporizador();
      }

      for (int i = 0; i < totalGotas; i++) {
        gotasDeChuva[i].cair();
        gotasDeChuva[i].exibir();

        if (esponja.intersecao(gotasDeChuva[i])) {
          gotasDeChuva[i].capturada();
          pontuacao++; // Incrementa a pontuação quando uma gota é capturada
        }

        if (gotasDeChuva[i].y > height) { // Se a gota chegar ao fundo da tela, o jogo termina
          pingo.play();
          jogoAtivo = false;
        }
      }
    } else {
      // Tela de derrota
      background(50, 100, 150); // Tela vermelha para indicar derrota
      fill(255);
      textSize(64);
      textAlign(CENTER, CENTER);
      text("Molhou!", width / 2, height / 2 - 50); // Mensagem de derrota
      textSize(32);
      text("Pressione 'R' para tentar novamente ou 'ESC' para sair", width / 2, height / 2 + 50);
    }
  }

  void keyPressed(int key) {
    if (!jogoAtivo) {
      if (key == 'r' || key == 'R') {
        // Reiniciar o jogo
        pontuacao = 0;
        totalGotas = 0;
        jogoAtivo = true;
        temporizador.iniciarTemporizador();
        background(255);
      } else if (key == ESC) {
        key = 0; // Previne que ESC feche o programa
        telaAtual = 0; // Volta para a tela inicial
        setup(); // Redesenha a tela inicial
      }
    }
  }

  class Esponja {
    float posicaoX;
    float posicaoY;
    float largura; // largura da esponja
    float altura;  // altura da esponja
    PVector[] poros; // Array para armazenar as posições dos poros

    Esponja(float largura, float altura, float posicaoX, float posicaoY) {
      this.posicaoX = posicaoX;
      this.posicaoY = posicaoY;
      this.largura = largura;
      this.altura = altura;
      inicializarPoros();
    }

    // Inicializa os poros com posições fixas em uma linha diagonal em relação à esponja
    private void inicializarPoros() {
      poros = new PVector[3]; // Número de poros
      poros[0] = new PVector(-largura / 4, -altura / 4); // Poro no canto superior esquerdo
      poros[1] = new PVector(0, 0); // Poro no centro
      poros[2] = new PVector(largura / 4, altura / 4); // Poro no canto inferior direito
    }

    // Exibe a esponja como um retângulo com bordas arredondadas
    public void exibirEsponja() {
      stroke(127);
      fill(255, 223, 128); // Cor da esponja
      rectMode(CENTER);
      rect(posicaoX, posicaoY, largura, altura, 20); // desenha um retângulo arredondado

      // Adicionar pequenos círculos para simular os poros da esponja
      fill(230, 190, 90); // Cor para os poros
      noStroke();
      for (PVector pore : poros) {
        ellipse(posicaoX + pore.x, posicaoY + pore.y, 12, 12); // Desenhar poros com tamanho fixo
      }
    }

    public boolean intersecao(Gota g) {
      // Verifica se a gota de chuva está dentro dos limites da esponja
      return (g.x > posicaoX - largura / 2 && g.x < posicaoX + largura / 2 &&
        g.y > posicaoY - altura / 2 && g.y < posicaoY + altura / 2);
    }
  }

  class Gota {
    float x;
    float y;
    color c;
    float r;
    float velocidade;

    Gota() {
      this.r = 10;
      this.x = random(width);
      this.y = -r * 4;
      this.velocidade = random(1, 3);
      this.c = color(50, 100, 150);
    }

    public void cair() {
      this.y += velocidade;
    }

    public void exibir() {
      fill(50, 100, 150);
      noStroke();
      ellipse(x, y, r * 2, r * 2);
    }

    public void capturada() {
      velocidade = 0;
      y = -1000;
    }
  }

  class Temporizador {
    int duracao;
    int inicio;

    Temporizador(int duracao) {
      this.duracao = duracao;
    }

    public void iniciarTemporizador() {
      inicio = millis();
    }

    public boolean tempoFinalizado() {
      return millis() - inicio > duracao;
    }
  }
}
