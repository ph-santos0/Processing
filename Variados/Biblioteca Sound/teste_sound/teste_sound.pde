import processing.sound.*;
SoundFile exp;

float tam = 200;
PImage crash;

void setup(){
   size(800,600);
   exp = new SoundFile(this,"aku_aku.mp3");
   crash = loadImage ("crash.png");
   textAlign(CENTER, CENTER);
   imageMode(CENTER);
}

void draw(){
  if(!exp.isPlaying()) {
    text ("aku aku", 400, 300);
  } else{
    image (crash, 400, 300, tam, tam);
    tam = tam + 10;
  }
}

void mousePressed(){
  exp.play();
}
