class Bouton{
  PVector Pos;
  float Taillex,Tailley;
  String Contenu;
  int TaillePolice = 20;
  color CouleurTexte = 0;
  
  Bouton(float x,float y,float Taillex,float Tailley){
      Pos = new PVector(x,y);
      this.Taillex = Taillex;
      this.Tailley = Tailley;
      Contenu = "\0";
  }

  void draw(){
    
    textSize(TaillePolice);
    if(Interieur()){
      fill(255,0,0);
    }else{
      fill(0,255,0);
    }
    textAlign(CENTER,CENTER);
    rect(Pos.x,Pos.y,Taillex,Tailley,3);
    fill(0);
    text(Contenu,Pos.x+Taillex/2,Pos.y+Tailley/2);
}
  void mousePressed(){
    if(Interieur()){
      println("Clique");
    }
  }
  Bouton Contenue(String C,boolean R){
  Contenu = C;
  if(R){
   float Diff = textWidth(C)-Taillex;
   Taillex += Diff;
  }
  return this;
}
  boolean Interieur(){
  if(mouseX>Pos.x && mouseX<Pos.x+Taillex && mouseY>Pos.y && mouseY<Pos.y+Tailley){
      return true;
    }else{
      return false;
    }
  }
}
