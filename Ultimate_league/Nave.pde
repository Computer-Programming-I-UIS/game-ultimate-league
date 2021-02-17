class Nave{
  float posx;
  float posy;
  float aceleracion= 0.05;
  float velocidad;
  float velocidadMin = 0.0;
  float velocidadMax = 5.0;
  float rotacion = 0.0;
  PImage nave;
  
  Nave( int POSX, int POSY ){
    nave = loadImage("00000802584.png");
    posx = POSX;
    posy = POSY;
  }
  
  void poner(){
      noFill();
      stroke(255);
      pushMatrix();
       translate(posx, posy);
       rotate(radians(rotacion));
       image(nave,0,0);
       beginShape();
       vertex(  20,   0 );
       vertex( -10, -10 );
       vertex(  -5,   0 );
       vertex( -10,  10 );
       endShape(CLOSE);
      popMatrix();    
    /* -- MOVEMENT -- */
      // The ship will always be moving according to its current delta.
      posx += (velocidad * Math.cos( radians(rotacion) ));
      posy += (velocidad * Math.sin( radians(rotacion) ));    
      // Maintains maximum velocity. 
      if( velocidad > velocidadMax ) { velocidad = velocidadMax; }      
      // Keeps rotation within 0 - 360 range
      if( rotacion > 360 ){ rotacion = 0; }
      if( rotacion < 0 ){ rotacion = 360; }

      if( keyCode == UP){
        velocidad += aceleracion;
      }    
      if( keyCode == LEFT && keyPressed){
        rotacion -= 2; 
      }    
      if( keyCode == RIGHT && keyPressed){
        rotacion += 2;
      }
  
      if( posx > width+10 )         { posx = width-width-10; }
      if( posx < width-width-10 )   { posx = width+10; }
      if( posy > height+10 )        { posy = height-height-10; }
      if( posy < height-height-10 ) { posy = height+10; }

  }
}
