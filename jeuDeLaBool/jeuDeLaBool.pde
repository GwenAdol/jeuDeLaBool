<<<<<<< HEAD
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
=======
Menu   M1;
Lancer L1;
balle  B1;
OTris  T1;
Niveau N1;
Editeur E1;
void setup()
{
  size(400,600);
  B1 = new  balle(50);
  L1 = new Lancer(B1);
  M1 = new Menu();
  N1 = new Niveau(0);
  E1 = new Editeur(1);
}

void draw(){
  
  background(120); //<>//
  if(!M1.Affiche){
    //N1.draw();
   //EnJeu();
   E1.draw();
  }else{
    M1.draw();
  }
  
}


void EnJeu(){
  B1.affich();
  B1.deplacement();
  B1.bord();
}
void mousePressed(){
  M1.mousePressed();
  E1.mousePressed();
}
void mouseMoved(){
  E1.mouseMoved();
}

void keyPressed(){
  E1.keyPressed();
}
>>>>>>> Saïd
