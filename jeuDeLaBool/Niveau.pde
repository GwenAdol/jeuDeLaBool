/*Gérer les niveau*/
class Niveau {
  TrouFinal T;
  Obs[] OB;
  Niveau(int NbNiv) {
    XML Fichier = loadXML("N"+NbNiv+".xml");
    T = new TrouFinal(10);
    T.PosTrou.set(Fichier.getChild("Trou").getFloat("X"),Fichier.getChild("Trou").getFloat("Y"));
    XML[] Obs = Fichier.getChildren("Obstacle");
    OB = new Obs[Obs.length];
    for(int i=0;i<Obs.length;i++){
      float x,y;
      x = Obs[i].getFloat("X");
      y = Obs[i].getFloat("Y");
      switch(Obs[i].getInt("Type")){
        case 0:
          OB[i] = new ORect(x,y);
        break;
        case 1:
          OB[i] = new OTris(x,y);
        break;
      }
    }
  }
  
  void draw(){
    for(Obs O : OB){
      O.draw();
    }
    T.affich();
  }
  
}