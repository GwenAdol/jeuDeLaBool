class TrouFinal {
  PVector PosTrou;
  float taille;
  boolean Trou;
  balle B1;

  TrouFinal(float xTaille) {
    PosTrou = new PVector();
    taille = xTaille;
    //B1 = bool;
    Trou = false;
  }
  void Fin() {/*on test si la balle est sur la position du trou*/

    float distanceBalleTrou = dist(B1.PosBalle.x, B1.PosBalle.y, PosTrou.x, PosTrou.y);
    if (distanceBalleTrou <= taille/2  ) {
      Trou = true;
      B1.vitesse.x = 0;
      B1.vitesse.y = 0;
    } else Trou = false;
  }
  void affich() {
    pushStyle();
    fill(0, 255, 0);
    ellipse(PosTrou.x, PosTrou.y, taille, taille);
    popStyle();
  }
}
