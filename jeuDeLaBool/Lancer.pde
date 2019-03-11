class Lancer{
  PVector Force;
  balle Sujet;
  Lancer(balle B){
    Force  = new  PVector();
    Sujet = B;
  }
  
 void draw(){
   stroke(0);
   if (mousePressed){
     line(mouseX,mouseY,Force.x,Force.y);  
   }
 }
 
 void mousePressed(){
   Force.set(mouseX,mouseY);
 }
 void mouseReleased(){
   Force.sub(mouseX,mouseY);
   Sujet.vitesse.add(Force.div(10));
 }
}
