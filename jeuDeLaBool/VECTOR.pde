void line(PVector P){
  line(mouseX,mouseY,P.x+mouseX,P.y+mouseY);
}
void line(PVector P,PVector D){
  line(D.x,D.y,P.x+D.x,P.y+D.y);
}
void line_(PVector P,PVector D){
  line(D.x,D.y,P.x,P.y);
}

void ellipse(PVector P){
  ellipse(P.x,P.y,10,10);
}
void triangle(PVector Pt0,PVector Pt1,PVector Pt2){
  triangle(Pt0.x,Pt0.y,Pt1.x,Pt1.y,Pt2.x,Pt2.y);
}
