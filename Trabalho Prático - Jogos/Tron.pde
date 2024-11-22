// Jogo Tron básico em Processing
class Trongame {
  // Configuração das cores
  color player1Color = color(0, 0, 255); // azul
  color player2Color = color(255, 100, 0); // laranja

  // Configuração do tamanho do grid
  int gridSize = 10;
  int cols, rows;
  int[][] grid;

  // Posições e direções dos jogadores
  float x1, y1, dirX1, dirY1;
  float x2, y2, dirX2, dirY2;

  // Estado do jogo
  boolean gameOver = false;

  boolean start = false;

  void setup() {
    fullScreen();
    background(0);
    cols = width / gridSize;
    rows = height / gridSize;

    grid = new int[cols][rows];

    // Inicializa os jogadores
    resetPlayers();

    // Define a taxa de atualização para controlar a velocidade
    frameRate(60);
  }

  void draw() {
    if (!start) {
      background(0);
      start = true;
    }
    //if(!tromOST.isPlaying()) {
    //  tromOST.loop();
    //}
    if (gameOver) {
      background(0);
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      text("Aperte R para resetar", width / 2, height / 2 + 50);
      text("Aperte ESC para sair", width / 2, height / 2 + 100);
      if (key == 'r' || key == 'R') {
        resetPlayers();
        background(0);
        gameOver = false;
      }
      return;
    }

    // Atualiza e desenha os jogadores
    updatePlayer(1);
    updatePlayer(2);

    // Desenha o grid
    drawGrid();

    // Verifica colisões
    checkCollision();
  }

  void keyPressed(int keyCode) {
    if (keyCode == 87 && (dirY1 == 0)) {
      dirX1 = 0;
      dirY1 = -gridSize;
    } // Jogador 1 para cima
    if (keyCode == 83 && (dirY1 == 0)) {
      dirX1 = 0;
      dirY1 = gridSize;
    }  // Jogador 1 para baixo
    if (keyCode == 65 && (dirX1 == 0)) {
      dirX1 = -gridSize;
      dirY1 = 0;
    } // Jogador 1 para esquerda
    if (keyCode == 68 && (dirX1 == 0)) {
      dirX1 = gridSize;
      dirY1 = 0;
    }  // Jogador 1 para direita

    if (keyCode == UP && (dirY2 == 0)) {
      dirX2 = 0;
      dirY2 = -gridSize;
    } // Jogador 2 para cima
    if (keyCode == DOWN && (dirY2 == 0)) {
      dirX2 = 0;
      dirY2 = gridSize;
    } // Jogador 2 para baixo
    if (keyCode == LEFT && (dirX2 == 0)) {
      dirX2 = -gridSize;
      dirY2 = 0;
    } // Jogador 2 para esquerda
    if (keyCode == RIGHT && (dirX2 == 0)) {
      dirX2 = gridSize;
      dirY2 = 0;
    } // Jogador 2 para direita
    if(keyCode == ESC) {
      tromOST.stop();
      telaAtual = 0;
    }
  }

  void updatePlayer(int player) {
    float x, y, dirX, dirY;
    color col;

    if (player == 1) {
      x = x1;
      y = y1;
      dirX = dirX1;
      dirY = dirY1;
      col = player1Color;
    } else {
      x = x2;
      y = y2;
      dirX = dirX2;
      dirY = dirY2;
      col = player2Color;
    }

    // Atualiza a posição dos jogadores
    x += dirX;
    y += dirY;

    // Verifica se o jogador está fora dos limites
    if (x < 0 || x >= width || y < 0 || y >= height) {
      gameOver = true;
      return;
    }

    // Desenha o jogador
    noStroke();
    fill(col);
    rect(floor(x / gridSize) * gridSize, floor(y / gridSize) * gridSize, gridSize, gridSize);

    // Verifica se o jogador colidiu com uma linha já existente
    if (grid[floor(x / gridSize)][floor(y / gridSize)] != 0) {
      gameOver = true;
      return;
    }

    // Marca a grade onde o jogador passou
    grid[floor(x / gridSize)][floor(y / gridSize)] = player;

    // Atualiza a posição do jogador
    if (player == 1) {
      x1 = x;
      y1 = y;
    } else {
      x2 = x;
      y2 = y;
    }
  }

  void drawGrid() {
    noStroke();
    for (int i = 0; i <= width; i += gridSize) {
      line(i, 0, i, height);
    }
    for (int j = 0; j <= height; j += gridSize) {
      line(0, j, width, j);
    }
  }

  void checkCollision() {
    // Verifica se os jogadores colidiram entre si
    if (floor(x1 / gridSize) == floor(x2 / gridSize) && floor(y1 / gridSize) == floor(y2 / gridSize)) {
      gameOver = true;
    }
  }

  void resetPlayers() {
    // Inicializa os jogadores
    x1 = 0;
    y1 = height / 2;
    dirX1 = gridSize;
    dirY1 = 0;

    x2 = width;
    y2 = height / 2;
    dirX2 = -gridSize;
    dirY2 = 0;

    // Limpa a grade
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j] = 0;
      }
    }

    gameOver = false;
  }
}
