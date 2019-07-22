 PVector Normal(PVector P){
    return new PVector(P.y,-P.x).normalize();
  }
  PVector Proj(PVector P,PVector N){
    return PVector.mult(N,P.dot(N));
  }
  PVector Vec(PVector P,PVector G){
    return PVector.sub(P,G);
  }
