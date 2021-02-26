import ddf.minim.*;

boolean isLeft, isRight, isUp, isCtrl;
int estado = 0, game=0;
PFont font;
PImage fondo;
PVector posicion;
float numast = 4;
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
ArrayList<Armas> armas;

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
  nave = new Nave(400,300);
  for (int i = 0; i < numast; i++) {
    asteroids.add(new Asteroides(posicion, random(80, 100), 1));
  }
 //scale(0.9);
 player.loop();
 player.setGain(-10);
 ingame.loop();
 ingame.setGain(-10);
 ingame.pause();
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
    soundMenu.play();
     
  }
  if(game==3){
    
    soundMenu.play();
    player.pause();
    mapa.poner();
    for (int i = 0; i < asteroids.size(); i++) {
      fill(255);
      Asteroides asteroides = asteroids.get(i);
      asteroides.poner();
      asteroides.update();
      asteroides.wrap();
    }
    
    nave.poner();
  }
  if(game==4){
    menu.gameover();
    soundMenu.play();
  }
  if(game==5){
    menu.creditos();
    soundMenu.play();
  }
}
