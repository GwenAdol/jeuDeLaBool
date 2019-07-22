balle  B1; 
Menu   M1;
Raquette R;
PVector Mur;
ORect Rect;
void setup()
{
  size(400,600);
  orientation(PORTRAIT);
  //M1 = new Menu();
  B1 = new balle(50);
  //Mur = new PVector(width/2,height/2);
  Rect = new ORect(width/2,height/2);
  R = new Raquette();
}

void draw()
{
  background(120);
  stroke(0);
  B1.affich();
  B1.deplacement();
  Rect.draw();
  println(Rect.Collission(B1));
  R.draw();
}
void line(PVector P){
  line(mouseX,mouseY,P.x+mouseX,P.y+mouseY);
}
void line(PVector P,PVector D){
  line(D.x,D.y,P.x+D.x,P.y+D.y);
}

 PVector Normal(PVector P){
    return new PVector(P.y,-P.x).normalize();
  }
  PVector Proj(PVector P,PVector N){
    return PVector.mult(N,P.dot(N));
  }
  PVector Vec(PVector P,PVector G){
    return PVector.sub(P,G);
  }
void mousePressed(){
  R.mousePressed();
}

void mouseReleased(){
  R.mouseReleased(B1);
}
