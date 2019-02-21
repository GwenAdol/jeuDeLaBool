balle bool;
void setup()
{
  size(480,700);
  bool=new balle();
}

void draw()
{
  background(0);  
  bool.deplacement();
  bool.bord();
  bool.affich();

}