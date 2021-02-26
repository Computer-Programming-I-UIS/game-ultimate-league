import ddf.minim.*;

int estado = 0, game=0, sonido=0, bandera=0;
PFont font;
PImage fondo;
PVector posicion;
PVector temppos;
float numAst = 4;
float numNave = 1;
float score = 0;
final int cantAsteroides = 4;
final int cantNaves = 1;
float add = 0.5;
final float cshoot1 = 0.005;
boolean[] keysPressed = new boolean[3];
float highscore = 30000;
Minim intro;
AudioPlayer player;
AudioPlayer gameover;
AudioPlayer disparo;
AudioPlayer soundMenu;
AudioPlayer impacto;
AudioPlayer moveNave;
AudioPlayer ingame;
Menu menu;
Mapa mapa;
Nave nave;
ArrayList<Asteroides> asteroids = new ArrayList<Asteroides>();
ArrayList<Armas> armas = new ArrayList<Armas>();

void setup(){
  size(800,600);
  frameRate(60);
  fondo = loadImage("0802584.jpg");
  intro = new Minim(this);
  player = intro.loadFile("throughspace.wav");
  gameover = intro.loadFile("GameOver.wav");
  disparo = intro.loadFile("shoot.wav");
  soundMenu = intro.loadFile("movex.wav");
  impacto = intro.loadFile("hit.wav");
  moveNave = intro.loadFile("move.wav");
  ingame = intro.loadFile("ingame.mp3");
  font = createFont("Century Gothic", 100);
  menu = new Menu(); 
  mapa = new Mapa();
  nave = new Nave();
  for (int i = 0; i < numAst; i++) {
    asteroids.add(new Asteroides(posicion, random(80, 100), 1));
  }
 //scale(0.9);
 player.loop();
 player.setGain(-5);
 ingame.loop();
 ingame.setGain(-5);
 ingame.pause();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    nave.cambioRotacion(0.1);
  } else if (keyCode == LEFT) {
    nave.cambioRotacion(-0.1);
  } else if ((keyCode == UP)) {
    nave.cambioace(true);
  } else if ((key == ' ')) {
    if (frameCount % 1 == 0) {
      armas.add(new Armas(nave.posicion, nave.direccion));
      disparo.play();
        if ( disparo.isPlaying() == true)
        {
          disparo.rewind();
        }
    }
  } 
}


void keyReleased() {
  if (keyCode == RIGHT) {
    nave.cambioRotacion(0);
  } else if (keyCode == LEFT)  {
    nave.cambioRotacion(0);
  } else if (keyCode == UP) {
    nave.cambioace(false);
  } else if (key == ' ') {
  }
}

void draw(){
  
  background(6,0,30);
  fill(75, 255, 255);
    textSize(12);
    text("FPS:" + frameRate, width-64, height-8);
  
  if (game==0){
    image(fondo,0,0);
    //player.shiftGain(player.getGain(),-80, FADE);
    if(keyPressed || mousePressed){
      game=1;
      mousePressed=false;
      
    }
  }
  if(game==1){
    
    menu.poner();
   
   
  } 
  if(game==2){
    menu.opciones();
    
  }
  if(game==3){
    bandera=0;
    soundMenu.play();
    player.pause();
    mapa.poner();
    for (int i = 0; i < asteroids.size(); i++) {
      fill(255);
      Asteroides asteroides = asteroids.get(i);
      asteroides.poner();
      if ((nave.colision(asteroides.posicion, asteroides.r)) && (nave.inmunidad == false)) {
        game = 4;
      }
    }
      stroke(255);
      for (int i = armas.size()-1; i >= 0; i--) {
      Armas arma = armas.get(i);
      arma.poner();
      arma.update();
      if (arma.fuera()) {
         armas.remove(i);
      } else {
        
        for (int j = asteroids.size()-1; j >= 0; j--) {
          Asteroides asteroide = asteroids.get(j);
          if (arma.colision(asteroide.posicion, asteroide.r)) {
            if (asteroide.r > 30) {
              ArrayList<Asteroides> newAsteroids = asteroide.romper();
              asteroids.addAll(newAsteroids);
            } else {
            }
            score += map(asteroide.r, 100, 0, 0, 200);
            asteroids.remove(j);
            if (score > highscore){
               highscore=score;
            }
                       
              if (asteroids.size() < numAst) {
              int temprand = int(random(0, 2));
              int temprand1 = int(random(0, 2));
              if ((temprand == 1) && (temprand1 == 1)) {
                temppos = new PVector(width, random(0, height));
              } else if ((temprand == 0) && (temprand1 == 1)) {
                temppos = new PVector(random(0, width), height);
              } else if ((temprand == 1) && (temprand1 == 0)) {
                temppos = new PVector(random(0, width), 0);
              } else {
                temppos = new PVector(0, random(0, height));
              }
              asteroids.add(new Asteroides(temppos, random(80, 100), 1));
              add *= random(1, 1.05);
              numAst += random(0, add);
            }
            armas.remove(i);
            break;
          }
        }
      }
    }
    fill(255);
    //textAlign(CENTER, CENTER);
    textSize(20);
    
    text("Score: " + floor(score/10)*10, 10, 20);
    text("HighScore: " + floor(highscore), 500, 20);
    stroke(255);
    strokeWeight(5);
    nave.poner();
  }
  if(game==4){
    tint(255,255);
    menu.gameover();
    fill(255);
    textSize(30);
    text(floor(score)*10, 460, 395);
    stroke(255);
    strokeWeight(5);
    if(bandera==1){
      add = 0.5;
      score = 0;
      nave = new Nave();
      asteroids.clear();
      armas.clear();
      
      numAst = cantAsteroides;
      numNave = cantNaves;
      
      for (int i = 0; i < numAst; i++) {
        temppos = new PVector(random(0, width), random(0, height));
        asteroids.add(new Asteroides(temppos, random(80, 100), 1));
      }  
    }
  }
  if(game==5){
    
    menu.creditos();
    
  }
  
}
