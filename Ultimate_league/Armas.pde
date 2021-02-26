class Armas {

  PVector pos;
  PVector vel;
  float r;
  
  Armas(PVector shipPos, float angle){
    pos = new PVector(shipPos.x, shipPos.y);
    vel = PVector.fromAngle(angle-PI/2);
    vel.mult(15);
    r = 10;
  }
  
  void update(){
    pos.add(vel);
  }
  
  void render(){
    strokeWeight(r);
    point(pos.x, pos.y);
  }
  
  boolean hits(PVector apos, float r){
    float d = dist(pos.x, pos.y, apos.x, apos.y);
    return (d < r);
  }
  
  boolean offscreen(){
    if((pos.x > width+r) || (pos.y > height+r)){
      return true;
    } else if((pos.x < -r) || (pos.y < -r)){
      return true;
    } else {
      return false;
    }
  }
}
