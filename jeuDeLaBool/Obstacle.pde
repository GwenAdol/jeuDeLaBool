class Obs{
  PVector Pos;
  float TailleX = 50;
  float TailleY = 50;
  Obs(float X,float Y){
    Pos = new PVector(X,Y);
  }
  void draw(){}
  
  boolean Interieur() {
    if (mouseX>Pos.x && mouseX<Pos.x+TailleX && mouseY>Pos.y && mouseY<Pos.y+TailleY) {
      return true;
    } else {
      return false;
    }
  }
}

class OTris extends Obs {
  
  OTris(float X,float Y){
    super(X,Y);
  }
  
  void draw(){
    pushMatrix();
    pushStyle();
    fill(255,0);
    triangle(Pos.x,Pos.y,Pos.x+TailleX,Pos.y,Pos.x+TailleX/2,Pos.y-TailleY);
    Image.triangle(Pos.x,Pos.y-TailleY,TailleX,TailleY);
    Calcul(B1.PosBalle,Pos);
    popStyle();
    popMatrix();
  }
}
class ORect extends Obs {
  
  ORect(float X,float Y){
    super(X,Y);
  }
  
  void draw(){
    pushMatrix();
    pushStyle();
    fill(255,0);
    rect(Pos.x,Pos.y,TailleX,TailleY,10);
    Image.buisson(Pos.x,Pos.y,TailleX,TailleY);//on donne les même propriété que le rectangle 
    popStyle();
    popMatrix();
    
  }
  
  
}

    boolean Calcul(PVector Point , PVector Vecteur){
     boolean Resp = false;
     float D;
     PVector V1 = new PVector();
     V1.set(PVector.lerp(Point,Vecteur,0.0));
     line(V1.x,V1.y,Vecteur.x,Vecteur.y);
     D = V1.y*Vecteur.x - V1.x*Vecteur.y;
     if(D <= 0){
       Resp = true;
     }else{
       Resp = false;
     }
    return Resp;
  }