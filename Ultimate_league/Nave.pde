class Nave{
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  int r;
  float direccion;
  float rotacion;
  boolean acelera = false;
  boolean inmunidad;
  float contador;
  PImage nave;

  Nave() {
    rotacion = 0;
    contador = 0;
    nave = loadImage("spaceshipblue.png");
    posicion = new PVector(width/2, height/2);
    r = 20;
    direccion = PI/2;
    velocidad = new PVector(0, 0);
    inmunidad = true;
  }
 

  void poner(){
      pushMatrix();
      translate(posicion.x, posicion.y);
      rotate(direccion);
      imageMode(CENTER);
      //ellipse(0, 0, 100, 100);
      if(inmunidad) {
        tint(map(int(random(10)), 0, 5, 0, 255));
        contador += 0.1;
        if(contador > 20){
          tint(250,250);
          inmunidad = false;
        }
      }
      image(nave,0,0);
      imageMode(0);
      popMatrix(); 
      update();
  }
  
 void update(){
    if(acelera){
      acel();
    }
    velocidad.mult(0.90);
    posicion.add(velocidad);
    reinicio();
    cambio();
    
  }
  
  void reinicio(){
    if(posicion.x > width+r){
      posicion.x = -r;
    } else if(posicion.x < -r){
      posicion.x = width+r;
    }
    if(posicion.y > height+r){
      posicion.y = -r;
    } else if(posicion.y < -r){
      posicion.y = height+r;
    }
  }
  
  void cambioace(boolean b){
    acelera = b;
  }
  
  void acel(){
    PVector force = PVector.fromAngle(direccion-PI/2);
    velocidad.add(force);
  }
  
  boolean colision(PVector apos, float ar){
    float d = dist(posicion.x, posicion.y, apos.x, apos.y);
    //ellipse(apos.x, apos.y, ar, ar);
    if((d <= r + ar )){
      return true;
    } else {
      return false;
    }
  }
  
   void cambioRotacion(float a){
    rotacion = a;
  }
  
  void cambio(){
    direccion += rotacion;
  }
}
