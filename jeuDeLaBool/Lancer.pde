class Lancer{
  PVector Force;
  
  Lancer(){
    Force  = new  PVector();
  }
  
 void draw(){
   if (mousePressed){
     line(mouseX,mouseY,Force.x,Force.y);  
   }
 }
 
 void mousePressed(){
   Force.set(mouseX,mouseY);
 }
 void mouseReleased(){
   Force.sub(mouseX,mouseY);
   
 }
}
