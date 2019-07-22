balle  B1; 
Menu   M1;
Raquette R;
PVector Mur;
OTris T;
void setup()
{
  size(400,600);
  orientation(PORTRAIT);
  //M1 = new Menu();
  B1 = new balle(50);
  //Mur = new PVector(width/2,height/2);
  T = new OTris(width/2,height/2);
  R = new Raquette();
}

void draw()
{
  background(120);
  stroke(0);
  B1.affich();
  B1.deplacement();
  T.draw();
  println(T.Collission(B1));
  R.draw();
}

void mousePressed(){
  R.mousePressed();
}

void mouseReleased(){
  R.mouseReleased(B1);
}
