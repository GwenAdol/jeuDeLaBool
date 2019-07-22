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

class OTris extends Obs {

  OTris(float X, float Y) {
    super(X, Y);
  }

  void draw() {
    triangle(Pos.x, Pos.y, Pos.x+TailleX, Pos.y, Pos.x+TailleX/2, Pos.y-TailleY);
    //if(Calcul(B1.PosBalle,Pos) && Calcul(B1.PosBalle,new PVector(Pos.x+TailleX,Pos.y)) && !Calcul(B1.PosBalle,new PVector(Pos.x+TailleX/2,Pos.y-TailleY))){
    // println("Ahh"+frameCount);
    //}
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
    for (int i = 0; i<4; i++) {
      
      N = Normal(Rect.Vecteur(i));
      R = (Proj(Vec(B.PosBalle, Rect.Point(i)), N));
      
      println("! "+ i+" "+str(R.mag() <= B.taille/2));
      if( R.mag() <= B.taille/2){
        V++;
        stroke(255,0,0);
      }
      line(N,Rect.Point(i));
      line(R,Rect.Point(i));
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
