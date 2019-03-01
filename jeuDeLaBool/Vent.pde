class Vent{
  PVector Vent;
  short Amplitude;
  float X = 0,Y = 0;
  float Amp = width/10,Taille=width/10;
  float Vst = 0.07;
  Vent(){
     Vent = new PVector();
  }
  
  Vent(PVector Autre){
     Vent = new PVector();
     Vent.set(Autre);
  }
  Vent(float x , float y){
    Vent = new PVector(x,y);
  }
  
  void Vents(balle B){
    B.acceleration.add(Vent);
  }
  
  Vent Aleatoire(float Min, float Max){
    Vent.set(random(Min,Max),random(Min,Max));
    return this;
  }
  void Ani(){
    noFill();
    pushMatrix();
    translate(X,Y);
    rotate(PVector.angleBetween(Vent,new PVector(1,0)));
    
    
    bezier(
    0 ,          Amp*1/10 * sin(frameCount*Vst-PI*3/4)+0 ,
    0+Taille ,   Amp*3/10 * sin(frameCount*Vst-PI*2/4)+0,
    0+2*Taille , Amp*3/10 * sin(frameCount*Vst-PI  /4)+0 ,
    0+3*Taille , Amp*1/10 * sin(frameCount*Vst       )+0);
    
    if(Y > height){
      Y = 0;
    }else{
      Y+= Vent.y/10;
    }
    
    if(X > width){
      X = 0;
    }else{
      X+= Vent.x/10;
    }
    popMatrix();
  }
}
