class Arrow {

  PVector pos;
  float len;

  Arrow(PVector pos, float len) {
    this.pos = pos;
    this.len = len;
  }

  void show(float theta) {
    noFill();
    stroke(#0000ff);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      line(-len/2, 0, len/2, 0);
    popMatrix();
  }
}
