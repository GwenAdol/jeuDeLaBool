class Vent{
  PVector Vent;
  
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
  
  boolean Vents(balle B){}
}
