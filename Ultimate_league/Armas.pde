class Armas {
  PVector posicion;
  PVector velocidad;
  float r;
  PImage bala;
  
  Armas(PVector posNave, float angulo){
    posicion = new PVector(posNave.x, posNave.y);
    velocidad = PVector.fromAngle(angulo-PI/2);
    velocidad.mult(15);
    bala = loadImage("bullet.png");
    r=10;
  }
  
  void update(){
    posicion.add(velocidad);
  }
  
  void poner(){
    imageMode(CENTER);
    image(bala, posicion.x, posicion.y);
    imageMode(0);
  }
  
  boolean colision(PVector newposicion, float r){
    float d = dist(posicion.x, posicion.y, newposicion.x, newposicion.y);
    return (d < r);
  }
  
  boolean fuera(){
    if((posicion.x > width+r) || (posicion.y > height+r)){
      return true;
    } else if((posicion.x < -r) || (posicion.y < -r)){
      return true;
    } else {
      return false;
    }
  }
}
