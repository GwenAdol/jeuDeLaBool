Menu   M1;
Lancer L1;
balle B1;
OTris T1;
void setup()
{
  size(400,600);
  orientation(PORTRAIT);
  M1 = new Menu();
  
  B1 = new  balle();
  L1 = new Lancer(B1);
  T1 = new OTris(width/2,height/2);
}

void draw()
{
  background(120);
  M1.draw();
  L1.draw();
  B1.affich();
  B1.deplacement();
  B1.bord();
  T1.draw();
}

void mousePressed(){
  L1.mousePressed();
}

void mouseReleased(){
  L1.mouseReleased();
}
