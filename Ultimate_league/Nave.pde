class Nave{
  float posx;
  float posy;
  float aceleracion;
  float velocidad;
  float velocidadMin = 0.0;
  float velocidadMax = 5.0;
  float rotacion = 0.0;
  PImage nave;
  boolean keyup = false;
  boolean keyright = false;
  boolean keyleft = false;
  boolean keyshoot = false;
  
  Nave( int POSX, int POSY ){
    nave = loadImage("spaceshipblue.png");
    posx = POSX;
    posy = POSY;
  }
  
   void gameKeyPressed() {
      // Toggles movement and shooting
      if (key == CODED) {
        if (keyCode == UP) keyup = true;
        if (keyCode == LEFT) keyleft = true;
        if (keyCode == RIGHT) keyright = true;
      }
      if (key == ' ') keyshoot = true;
   }
  
  void poner(){
      pushMatrix();
      translate(posx, posy);
      rotate(radians(rotacion));
      imageMode(CENTER);
      //ellipse(0, 0, 100, 100);
      image(nave,0,0);
      imageMode(0);
      popMatrix();    
    /* -- MOVEMENT -- */
      // The ship will always be moving according to its current delta.
      posx += (velocidad * Math.cos( radians(rotacion) ));
      posy += (velocidad * Math.sin( radians(rotacion) ));   
      aceleracion=atan2(posy, posx);
      // Maintains maximum velocity. 
      if( velocidad > velocidadMax ){ 
        velocidad = velocidadMax; 
      }      
      // Keeps rotation within 0 - 360 range
      if( rotacion > 360 ){ 
        rotacion = 0; 
      }
      if( rotacion < 0 ){ 
        rotacion = 360; 
      }
      //while(keyCode == UP){
      if( keyCode==UP){
          velocidad+=aceleracion;
      }
      if( keyCode == LEFT && keyPressed){
        rotacion -= 5; 
      }  
      if( keyCode == RIGHT && keyPressed){
        rotacion += 5;
      }
      if( key == ' '  && keyPressed==true){
        armas.add( new Armas(posx, posy, true));
      }
      
      //if(velocidad>=velocidadMax)velocidad-=aceleracion; println(aceleracion, velocidad);
      
      
      if( posx > width+10 )         { posx = width-width-10; }
      if( posx < width-width-10 )   { posx = width+10; }
      if( posy > height+10 )        { posy = height-height-10; }
      if( posy < height-height-10 ) { posy = height+10; }
      
     
  }

  void gameKeyReleased() {
  // Untoggles movement and shooting
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
  }
  if (key == ' ') keyshoot = false;
  }
  
  
}
