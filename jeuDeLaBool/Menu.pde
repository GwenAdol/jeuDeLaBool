
class Menu{
  Bouton[] B = new Bouton[3];
  PFont Titre = createFont("Police/Go Banana.ttf",60);
  boolean Affiche = true;
  Menu(){
  B[0] = new Bouton(width*1/3.0,height*3/10.0,width*1/3,height*1/15).Contenue("  Jouer !  ",false);
  B[1] = new Bouton(width*1/3.0,height*4/10.0,width*1/3,height*1/15).Contenue("  Parametre  ",false);
  B[2] = new Bouton(width*1/3.0,height*5/10.0,width*1/3,height*1/15).Contenue("  Quitter  ",false);
  }
  void draw(){
    textSize(60);
    
    textFont(Titre);    
    text("Jeu de la bool ",width/2,height*1/10);
    
    for(Bouton B : B){
      B.draw();
    }
  }
  void mousePressed(){
    int P = 4;
    for(int i = 0; i< B.length;i++  ){
      if(B[i].Interieur()){
        P = i;
      }
    }
    switch(P){
      case 0 :
        Affiche = false;
      break;
      
      case 1:
      
      break;
      
      case 2:
      
      break;
    }
    
  }
  
  
}
