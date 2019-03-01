Menu   M1;
Vent   V1;
void setup()
{
  size(400,600);
  orientation(PORTRAIT);
  M1 = new Menu();
  V1 = new Vent().Aleatoire(0,10);
  
}

void draw()
{
  background(120);
  M1.draw();
  V1.Ani();
  
}

void mousePressed(){
}
