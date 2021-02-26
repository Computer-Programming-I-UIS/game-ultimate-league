class Armas {
  int velocidad = 10;
  PVector pos;
  boolean change;
  Armas(float x, float y, boolean cambio) {
    if (cambio) {
      x=x+25;
    } else {
      velocidad=2;
    }
    pos= new PVector(x, y);
    change=cambio;
  }

  void update() {
    fill(0);
    if (game==3&&change) {
      pos.y = pos.y - velocidad;
      rect(pos.x, pos.y, 5, 5);
      }
    }
}
