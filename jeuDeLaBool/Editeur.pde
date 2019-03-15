class Editeur {
  OTris T;
  ORect R;
  TrouFinal Tr;
  XML Fichier;
  int Type = 0;
  int ID = 0;
  boolean Selection = false;
  int SID = 0;


  Editeur(int NBNiv) {
    Tr = new TrouFinal(50);
    T  = new OTris(0, 0);
    R  = new ORect(0, 0);
    Fichier = new XML("N"+NBNiv);
  }

  void draw() {
    XML[] OBs = Fichier.getChildren("Obstacle");
    for (XML O : OBs) {
      // println(O);
      if (O.getInt("Type") == 0) {
        R.Pos.set(O.getFloat("X"), O.getFloat("Y"));
        R.draw();
      } else {
        T.Pos.set(O.getFloat("X"), O.getFloat("Y"));
        T.draw();
      }
    }
    Affiche();
  }
  void mousePressed() {
    if (Type != 2) {
      Ajout();
    } else {
      Selec();
    }
  }

  void Ajout() {
    XML Obstacle = Fichier.addChild("Obstacle");
    Obstacle.setInt("ID", ID);
    Obstacle.setInt("Type", Type);
    Obstacle.setFloat("X", mouseX);
    Obstacle.setFloat("Y", mouseY);
    println("Obstacle", Obstacle);
    ID++;
  }

  void Selec() {
    if (!Selection) {
      XML[] OBs = Fichier.getChildren("Obstacle");
      for (XML O : OBs) {
        // println(O);
        if (O.getInt("Type") == 0) {
          R.Pos.set(O.getFloat("X"), O.getFloat("Y"));
          if (R.Interieur()) {
            Selection = true;
            SID = O.getInt("ID");
          }
        } else {
          T.Pos.set(O.getFloat("X"), O.getFloat("Y"));
          if (T.Interieur()) {
            Selection = true;
            SID = O.getInt("ID");
          }
        }
      }
    } else {
      Selection = false;
    }
  }

  void mouseMoved() {
    switch (Type) {
    case 0:
      R.Pos.set(mouseX, mouseY);
      R.draw();
      break;
    case 1:
      T.Pos.set(mouseX, mouseY);
      T.draw();
      break;
    }
  }

  void keyPressed() {
    switch(key) {
    case 'e':
      Type = 2;
      break;

    case '0':
      Type = 0;
      break;

    case '1':
      Type = 1;
      break;

    case ENTER:
      saveXML(Fichier,"data/"+Fichier.getName()+".xml");
      break;
    }
  }
  
  void Affiche() {
    if (Type == 2 && Selection) {
      XML[] Obs = Fichier.getChildren("Obstacle");
      Obs[SID].setInt("X", mouseX);
      Obs[SID].setInt("Y", mouseY);
    } else {
      if (Type == 0) {
        R.Pos.set(mouseX, mouseY);
        R.draw();
      }
      if (Type == 1) {
        T.Pos.set(mouseX, mouseY);
        T.draw();
      }
    }
  }
}
