class Arrow {

  PVector pos;

  Arrow(PVector pos, float len) {
    this.pos = pos;
  }

  void show() {
    noFill();
    stroke(255);
    pushMatrix();
      translate(pos.x, pos.y);
      line(pos.x, pos.y, pos.x + len, pos.y);
    popMatrix();
  }
}
