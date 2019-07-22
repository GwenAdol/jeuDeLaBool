class OTris extends Obs {
  PVector[] Sommet = new  PVector[3];
  OTris(float X, float Y) {
    super(X, Y);
    Sommet[0] = new PVector(X, Y+5) ;
    Sommet[1] = new PVector(X + TailleX, Y-6) ;
    Sommet[2] = new PVector(X, Y+ TailleX) ;
  }


  void draw() {
    triangle(Sommet[0], Sommet[1], Sommet[2]);
  }

  Boolean Collission(balle B) {
    PVector N= new PVector(), R= new PVector();
    Boolean V = true;
    for (int i = 0; i<3; i++) {

      N = Normal(Vecteur(i));
      R = (Proj( Vec(B.PosBalle, Sommet[i]).add(Sommet[i]), N));
      PVector[] ProjBalle = new PVector[2];
      ProjBalle[0] = new PVector();
      ProjBalle[1] = new PVector();
      R.normalize(ProjBalle[0]);
      ProjBalle[0].setMag(R.mag()-B.taille/2);
      R.normalize(ProjBalle[1]);
      ProjBalle[1].setMag(R.mag()+B.taille/2);

      PVector[] ProjRect = new PVector[2];
      ProjRect[0] = new PVector();
      ProjRect[1] = new PVector();

      stroke(0);
      switch(i) {
        case(0):
        ProjRect[0].set(Proj(Sommet[1], N));
        ProjRect[1].set(Proj(Sommet[2], N));
        break;
        case(1):
        ProjRect[0].set(Proj(Sommet[1], N));
        ProjRect[1].set(Proj(Sommet[0], N));
        break;
        case(2):
        ProjRect[0].set(Proj(Sommet[2], N));
        ProjRect[1].set(Proj(Sommet[1], N));
        break;
      }
      if (!Chevauche(ProjBalle, ProjRect, ProjBalle[0].dist(ProjBalle[1]) +ProjRect[0].dist(ProjRect[1]))) {
        V &= false;
        
      }
      
    }
    return V;
  }

  Boolean Chevauche(PVector P[], PVector R[], float Distance) {
    return Chevauche(P[0], P[1], R[0], R[1], Distance);
  }

  Boolean Chevauche(PVector P, PVector Q, PVector R, PVector S, float Distance) {
    float D = 0;
    D = P.dist(R);
    if (P.dist(S)>= D)D = P.dist(S);
    if (Q.dist(R)>= D)D = Q.dist(R);
    if (Q.dist(S)>= D)D = Q.dist(S);
    if (D <= Distance) {
      return true;
    } else {
      return false;
    }
  }
  Boolean Interieur(PVector P, PVector Q, PVector R) {
    println(PVector.dot(PVector.sub(Q, P), PVector.sub(Q, P)));
    println(PVector.sub(P, Q).dot(PVector.sub(P, R)));
    return PVector.dot(PVector.sub(P, Q), PVector.sub(P, Q)) < PVector.sub(P, Q).dot(PVector.sub(P, R));
  }
  PVector Vecteur(int i) {
    PVector P = new PVector();
    switch(i) {
      case(0):
      P = PVector.sub( Sommet[0], Sommet[1] );
      break;
      case(1):
      P = PVector.sub(Sommet[1], Sommet[2] );
      break;
      case(2):
      P = PVector.sub(Sommet[2], Sommet[0] );
      break;
    default:
      break;
    }
    return P;
  }
}
