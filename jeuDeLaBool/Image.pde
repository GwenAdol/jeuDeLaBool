class Image{
 PImage fond,buisson,triangle;
 
  Image()
  {
    fond = loadImage("fond_JEUDELABOOL_colori.png");//importer les images 
    buisson = loadImage("feuille_noyer_round.jpg");
    triangle = loadImage("triangle_sticker.png");
  }
  
  void fond()//dessiner
  {
    image(fond,0,0);
  }
  void buisson(float x,float y,float taillex,float tailley)
  {
   image(buisson,x,y,taillex,tailley); 
  }
  void triangle(float x, float y, float taillex, float tailley)
  {
    image(triangle, x, y, taillex, tailley);
  }
}