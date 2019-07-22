class Obs {
  PVector Pos;
  float TailleX = 50;
  float TailleY = 50;
  Obs(float X, float Y) {
    Pos = new PVector(X, Y);
  }
  void draw() {
  }

  boolean Interieur() {
    if (mouseX>Pos.x && mouseX<Pos.x+TailleX && mouseY>Pos.y && mouseY<Pos.y+TailleY) {
      return true;
    } else {
      return false;
    }
  }
}


class ORect extends Obs {

  ORect(float X, float Y) {
    super(X, Y);
  }

  void draw() {
    stroke(0);
    fill(255);
    rect(Pos.x, Pos.y, TailleX, TailleY);
  }
  Boolean Collission(balle B) {
    PVector N= new PVector(), R= new PVector();
    short V = 0;

    N = Normal(Vecteur(0));
    R = (Proj( Vec(B.PosBalle, Point(0)), N));

    line(R, Point(0).sub(100, 0));
    PVector[] ProjBalle = new PVector[2];

    ProjBalle[0] = new PVector();
    ProjBalle[1] = new PVector();

    //ProjBalle[0].set(R).add(Point(0));
    R.normalize(ProjBalle[0]);
    ProjBalle[0].setMag(R.mag()-B.taille/2);
    ProjBalle[0].add(Point(0));
    ellipse(ProjBalle[0]);

    R.normalize(ProjBalle[1]);
    ProjBalle[1].setMag(R.mag()+B.taille/2);
    ProjBalle[1].add(Point(0));
    ellipse(ProjBalle[1]);

    PVector[] ProjRect = new PVector[4];
    ProjRect[0] = new PVector();
    ProjRect[1] = new PVector();
    ProjRect[2] = new PVector();
    ProjRect[3] = new PVector();
    for (int i = 0; i<4; i++) {
      ProjRect[i].set(Proj(Point(i), N));
      ellipse(ProjRect[i]);
    }
    
    
    return (V % 2 == 0 && V != 0);
  }
  PVector Vecteur(int i) {
    PVector P = new PVector();
    switch(i) {
      case(0):
      P = PVector.sub(new PVector(Pos.x+TailleX, Pos.y), new PVector(Pos.x, Pos.y));
      break;
      case(1):
      P = PVector.sub(new PVector(Pos.x+TailleX, Pos.y+TailleY), new PVector(Pos.x+TailleX, Pos.y));
      break;
      case(2):
      P = PVector.sub(new PVector(Pos.x, Pos.y+TailleY), new PVector(Pos.x+TailleX, Pos.y+TailleY));
      break;
      case(3):
      P = PVector.sub(new PVector(Pos.x, Pos.y), new PVector(Pos.x, Pos.y+TailleY));
      break;
    default:
      break;
    }
    return P;
  }
  PVector Point(int i) {
    PVector P = new PVector();
    switch(i) {
      case(0):
      P.set(Pos.x, Pos.y);
      break;
      case(1):
      P.set(Pos.x+TailleX, Pos.y);
      break;
      case(2):
      P.set(Pos.x+TailleX, Pos.y+TailleY);
      break;
      case(3):
      P.set(Pos.x, Pos.y+TailleY);
      break;
    default:
      break;
    }
    return P;
  }
}

boolean Calcul(PVector Point, PVector Vecteur) {
  boolean Resp = false;
  float D;
  PVector V1 = new PVector();
  V1.set(PVector.sub(Vecteur, Point));
  stroke(0);
  strokeWeight(2);
  line(V1.x, V1.y, Vecteur.x, Vecteur.y);
  println(V1.x, V1.y, Vecteur.x, Vecteur.y);
  D = V1.y*Vecteur.x - V1.x*Vecteur.y;
  if (D <= 0) {
    Resp = true;
  } else {
    Resp = false;
  }
  return Resp;
}
