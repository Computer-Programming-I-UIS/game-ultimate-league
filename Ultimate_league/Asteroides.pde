class Asteroides{
  PVector pos;
  PVector vel;
  float r = random(20, 30);
  float[] offset;
  int total;
  int iteration;
  PImage skin;
  
  Asteroides(PVector _pos, float _r, int _iterate){
    skin = loadImage("Asteroid Brown.png");
    //skin = loadImage("Layered Rock.png");
    if(_pos == null){
      pos = new PVector(random(width), random(height));
    } else {
      pos = new PVector(_pos.x, _pos.y);
    }
    iteration = _iterate;
    vel = PVector.random2D();
    vel.mult(map(iteration, 1, 4, 1.5, 3));
    r = _r;
    total = floor(random(5, 15));
    offset = new float[total];
    for(int i = 0; i < total; i++){
      offset[i] = random(-r*0.5, r*0.5);
    }
  }
  
  void update(){
    pos.add(vel);
  }
  
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    beginShape();
    //ellipse(0, 0, r*2, r*2);
    rotate(PI/6);
    image(skin, -r, -r, r*2, r*1.5);
    endShape(CLOSE);
    popMatrix();
  }
  
  ArrayList breakup(){
    ArrayList<Asteroides> newA = new ArrayList<Asteroides>();
    newA.add(new Asteroides(pos, r*0.65, iteration+1));
    newA.add(new Asteroides(pos, r*0.65, iteration+1));
    return newA;
  }
  
  void wrap(){
    if(pos.x > width+r){
      pos.x = -r;
    } else if(pos.x < -r){
      pos.x = width+r;
    }
    if(pos.y > height+r){
      pos.y = -r;
    } else if(pos.y < -r){
      pos.y = height+r;
    }
  }
  
  void reset(){
    pos = new PVector(random(width), random(height));
    r = random(60, 80);
  }
}
