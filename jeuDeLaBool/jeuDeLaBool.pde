balle bool; 
TrouFinal trou;
void setup() 
{ 
  size(480, 700); 
  bool=new balle(50);
  trou = new TrouFinal(50);
} 

void draw() 
{ 
  background(0);   
  bool.bord(); 
  bool.deplacement(); 
  bool.affich();
  trou.affich();
  trou.Fin();
  println(trou.Trou);
}