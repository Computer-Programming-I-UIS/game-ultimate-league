import ddf.minim.*;
boolean isLeft, isRight, isUp, isCtrl;
int estado = 0, game=0;
PFont font;
PImage fondo;
PVector posicion;
float numast = 4;
Minim intro;
AudioPlayer player;
AudioPlayer start;
Menu menu;
Mapa mapa;
Nave nave;

ArrayList<Asteroides> asteroids = new ArrayList<Asteroides>();
final int numberAsteroids = 4;


void setup(){
  size(800,600);
  frameRate(60);
  fondo = loadImage("0802584.jpg");
  intro = new Minim(this);
  player = intro.loadFile("0808.wav");
  start = intro.loadFile("SpaceFMin.wav");
  font = createFont("Century Gothic", 100);
  menu = new Menu(); 
  mapa = new Mapa();
  for (int i = 0; i < numast; i++) {
    asteroids.add(new Asteroides(posicion, random(80, 100), 1));
  }
 scale(0.5);
}

void draw(){
  background(6,0,30);
  fill(75, 255, 255);
    textSize(12);
    text("FPS:" + frameRate, width-64, height-8);
  
  if (game==0){
    
    image(fondo,0,0);
    player.play();
    if(keyPressed || mousePressed){
      game=1;
    }
  }
  if(game==1){
    
    menu.poner();
  }
  if(game==2){
    menu.opciones();
  }
  if(game==3){
    
    player.pause();
    mapa.poner();
   
    for (int i = 0; i < asteroids.size(); i++) {
      fill(255);
      Asteroides asteroides = asteroids.get(i);
      asteroides.render();
      asteroides.update();
      asteroides.wrap();
    }
  }
}

void keyReleased() {
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b) { //"switch" is similar to the "else if" structure 
  switch (k) {
  case UP:
    return isUp = b;

  case LEFT:
    return isLeft = b;

  case RIGHT:
    return isRight = b;

  case CONTROL:
    return isCtrl = b;

  default:
    return b;
  }
}
