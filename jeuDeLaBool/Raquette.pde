class Raquette {
  PVector Pos;
  Raquette() {
    Pos = new PVector();
  }

  void draw() {
    if (mousePressed) {
      stroke(0, 255, 0);
      line(Pos.x,Pos.y,mouseX,mouseY);
    }
  }

  void mousePressed() {
    Pos.set(mouseX, mouseY);
  }
  void mouseReleased(balle B) {
    Pos.sub(mouseX, mouseY);
    B.acceleration.add(Pos.mult(1/10));
  }
}
