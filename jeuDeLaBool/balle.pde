class balle//objet 
{
  PVector PosBalle;//paramètre de notre objet 
  int taille;
  PVector acceleration;
  PVector vitesse;
  
  balle()//constructeur de l'objet
  {
    PosBalle=new PVector(100,200);
    acceleration = new PVector();
    vitesse = new PVector();
    taille=50;    
    fill(255);
    noStroke();
  }
  
 void deplacement()
  {
     if(mousePressed == true)
    {
       PosBalle.x = mouseX;
       PosBalle.y = mouseY;
    }
    
    //on s'occupe de la position 
    PosBalle.x = PosBalle.x + vitesse.x;
    PosBalle.y = PosBalle.y + vitesse.y;
   
  }
  
  void affich()
  {
   ellipse(PosBalle.x,PosBalle.y,taille,taille); 
  }
  
  void bord()
  {
    if(PosBalle.x+(taille/2)>=width)//bord droit
    {
      PosBalle.x = width-(taille/2);
    }
    
    if(PosBalle.x-(taille/2)<=0)//bord gauche
    {
      PosBalle.x = 0+(taille/2);
    }
    if(PosBalle.y+(taille/2)>=height)//en bas
    {
     PosBalle.y = height-(taille/2); 
    }
    if(PosBalle.y-(taille/2)<=0)//haut
    {
      PosBalle.y = 0+(taille/2); 
    }
  }
}