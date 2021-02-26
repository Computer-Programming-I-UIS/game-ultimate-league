class Asteroides{
  PVector posicion;
  PVector velocidad;
  float r = random(20, 30);
  float[] fuera;
  int total;
  int iteracion;
  PImage skin;
  
  Asteroides(PVector Apos, float Ar, int Aiterado){
    skin = loadImage("Asteroid Brown.png");
    //skin = loadImage("Layered Rock.png");
    if(Apos == null){
      posicion = new PVector(random(width), random(height));
    } else {
      posicion = new PVector(Apos.x, Apos.y);
    }
    iteracion = Aiterado;
    velocidad = PVector.random2D();
    velocidad.mult(map(iteracion, 1, 4, 1.5, 3));
    r = Ar;
    total = floor(random(5, 15));
    fuera = new float[total];
    for(int i = 0; i < total; i++){
      fuera[i] = random(-r*0.5, r*0.5);
    }
  }
  
  void update(){
    posicion.add(velocidad);
  }
  
  void poner(){
    pushMatrix();
    translate(posicion.x, posicion.y);
    beginShape();
    rotate(PI/6);
    //ellipse(0, 0, r*2, r*1.05);
    image(skin, -r, -r, r*2, r*1.5);
    endShape(CLOSE);
    popMatrix();
    reinicio();
    update();
  }
  
  ArrayList romper(){
    ArrayList<Asteroides> newA = new ArrayList<Asteroides>();
    newA.add(new Asteroides(posicion, r*0.65, iteracion+1));
    newA.add(new Asteroides(posicion, r*0.65, iteracion+1));
    return newA;
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
  
  void reset(){
    posicion = new PVector(random(width), random(height));
    r = random(60, 80);
  }
}
