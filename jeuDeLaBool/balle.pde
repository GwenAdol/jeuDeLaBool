class balle//objet 
{
  PVector PosBalle;//paramètre de notre objet 
  float taille;
  PVector acceleration;
  PVector vitesse;

  balle(float xTaille)//constructeur de l'objet
  {
    PosBalle=new PVector(100, 200);
    acceleration = new PVector();
    vitesse = new PVector(4, 8);
    taille=xTaille;    
    fill(255);
    noStroke();
  }

  void deplacement()
  {
    if (mousePressed == true)
    {
      PosBalle.x = mouseX;
      PosBalle.y = mouseY;
    }

    //on s'occupe de la position 
    PosBalle.x = PosBalle.x + vitesse.x;
    PosBalle.y = PosBalle.y + vitesse.y;

    if (vitesse.x > 0) {//vitesse positive 
      do {
        vitesse.x = abs(vitesse.x) - (abs(vitesse.x)/200);//frotement de la balle
      } while (vitesse.x < 0.001);
    }
    if (vitesse.x < 0) {//vitesse negative
      do {
        vitesse.x = -(abs(vitesse.x) - (abs(vitesse.x)/200));//frotement de la balle
      } while (vitesse.x > 0.001);
    }

    if (vitesse.y > 0) {//vitesse positive 
      do {
        vitesse.y = abs(vitesse.y) - (abs(vitesse.y)/200);//frotement de la balle
      } while (vitesse.y < 0.001);
    }
    if (vitesse.y < 0) {//vitesse negative
      do {
        vitesse.y = -(abs(vitesse.y) - (abs(vitesse.y)/200));//frotement de la balle
      } while (vitesse.y > 0.001);
    }
  }

  void affich()
  {
    ellipse(PosBalle.x, PosBalle.y, taille, taille);
  }

  void bord()
  {
    if (PosBalle.x+(taille/2)>=width)//bord droit
    {
      vitesse.x = -vitesse.x;
    }

    if (PosBalle.x-(taille/2)<=0)//bord gauche
    {
      vitesse.x = -vitesse.x;
    }
    if (PosBalle.y+(taille/2)>=height)//en bas
    {
      vitesse.y = -vitesse.y;
    }
    if (PosBalle.y-(taille/2)<=0)//haut
    {
      vitesse.y = -vitesse.y;
    }
  }

  void PosBalle() {
  }
}