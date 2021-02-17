class Mapa{
  int punto = 200;
  int score = 0, highscore = 100;
  int[] puntoVel = new int [punto];
  int[] puntox = new int [punto];
  int[] puntoy = new int [punto];

    
  Mapa(){
    
    for (int i = 0; i < punto; i++) {
    puntox[i] = int(random(0, 800));
    puntoy[i] = int(random(0, 600));
    puntoVel[i] = int(random(1, 1));
    }
    if (score > highscore){
      highscore=score;
    }
    
  }
  
  void poner(){

    rectMode(CENTER);
    for (int i=0; i<punto; i++) {
      fill(random(200),random(100),random(255));
      noStroke();
      rect(puntox[i], puntoy[i], 4, 4);
    }
    for (int i=0;i<punto;i++) {
      puntoy[i]+= puntoVel[i];
      if (puntoy[i] > height) {
        puntoy[i] = 0;
      }
    }
  }
  
  

  
  

}
