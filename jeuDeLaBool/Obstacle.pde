class Obs{
  PVector Pos;
  float TailleX = 50;
  float TailleY = 50;
  Obs(float X,float Y){
    Pos = new PVector(X,Y);
  }
  
}

class OTris extends Obs {
  
  OTris(float X,float Y){
    super(X,Y);
  }
  
  void draw(){
    triangle(Pos.x,Pos.y,Pos.x+TailleX,Pos.y,Pos.x+TailleX/2,Pos.y-TailleY);
    Calcul(B1.PosBalle,Pos);
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
