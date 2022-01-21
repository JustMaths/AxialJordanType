/*



*/
intrinsic J3gen(:field:=Rationals()) -> AlgGen
  {

  }
  F<al, bt, gm, psi> := FunctionField(field, 4);
  
  // order in the basis: a, b, c, ab, bc, ac, a(bc), b(ca), c(ab)
  // al=(a,b), bt=(b,c), gm=(a,c), psi=(ab,c)

  mult := [
  [ [ 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
    [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 1/2*al, 0, 0, 1/2, 0, 0, 0, 0, 0 ],
    [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 1/2*gm, 0, 0, 0, 0, 1/2, 0, 0, 0 ],
    [ 1/2*psi, 0, 0, 0, 0, 0, 1/2, 0, 0 ],
    [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, 1/4, 1/4, -1/4 ],
    [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, 1/4, -1/4, 1/4 ] ],

  [ [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ],
    [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 1/2*al, 0, 1/2, 0, 0, 0, 0, 0 ],
    [ 0, 1/2*bt, 0, 0, 1/2, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, 1/4, 1/4, -1/4 ],
    [ 0, 1/2*psi, 0, 0, 0, 0, 0, 1/2, 0 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, -1/4, 1/4, 1/4 ] ],

  [ [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ],
    [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ],
    [ 0, 0, 1/2*bt, 0, 1/2, 0, 0, 0, 0 ],
    [ 0, 0, 1/2*gm, 0, 0, 1/2, 0, 0, 0 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, 1/4, -1/4, 1/4 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, -1/4, 1/4, 1/4 ],
    [ 0, 0, 1/2*psi, 0, 0, 0, 0, 0, 1/2 ] ],

  [ [ 1/2*al, 0, 0, 1/2, 0, 0, 0, 0, 0 ],
    [ 0, 1/2*al, 0, 1/2, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ],
    [ 1/4*al, 1/4*al, 0, 1/2*al, 0, 0, 0, 0, 0 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, 1/4, -1/4, 1/4 ],
    [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, -1/4, 1/4, 1/4 ],
    [ 1/8*al*bt+1/8*psi, 1/8*psi, 0, 1/4*psi, 1/8*al, 0, 1/4*al, 0, 0 ],
    [ 1/8*psi, 1/8*al*gm+1/8*psi, 0, 1/4*psi, 0, 1/8*al, 0, 1/4*al, 0 ],
    [ 1/8*al*bt, 1/8*al*gm, 0, 1/2*psi, 1/8*al, 1/8*al, -1/4*al,
        -1/4*al, 1/2*al ] ],

  [ [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 1/2*bt, 0, 0, 1/2, 0, 0, 0, 0 ],
    [ 0, 0, 1/2*bt, 0, 1/2, 0, 0, 0, 0 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, 1/4, -1/4, 1/4 ],
    [ 0, 1/4*bt, 1/4*bt, 0, 1/2*bt, 0, 0, 0, 0 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, 1/4, 1/4, -1/4 ],
    [ 0, 1/8*bt*gm, 1/8*al*bt, 1/8*bt, 1/2*psi, 1/8*bt, 1/2*bt,
        -1/4*bt, -1/4*bt ],
    [ 0, 1/8*bt*gm+1/8*psi, 1/8*psi, 0, 1/4*psi, 1/8*bt, 0, 1/4*bt, 0 ],
    [ 0, 1/8*psi, 1/8*al*bt+1/8*psi, 1/8*bt, 1/4*psi, 0, 0, 0, 1/4*bt ] ],
    
  [ [ 1/2*gm, 0, 0, 0, 0, 1/2, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ],
    [ 0, 0, 1/2*gm, 0, 0, 1/2, 0, 0, 0 ],
    [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, -1/4, 1/4, 1/4 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, 1/4, 1/4, -1/4 ],
    [ 1/4*gm, 0, 1/4*gm, 0, 0, 1/2*gm, 0, 0, 0 ],
    [ 1/8*bt*gm+1/8*psi, 0, 1/8*psi, 0, 1/8*gm, 1/4*psi, 1/4*gm, 0, 0 ],
    [ 1/8*bt*gm, 0, 1/8*al*gm, 1/8*gm, 1/8*gm, 1/2*psi, -1/4*gm,
        1/2*gm, -1/4*gm ],
    [ 1/8*psi, 0, 1/8*al*gm+1/8*psi, 1/8*gm, 0, 1/4*psi, 0, 0, 1/4*gm ] ],

  [ [ 1/2*psi, 0, 0, 0, 0, 0, 1/2, 0, 0 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, 1/4, 1/4, -1/4 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, 1/4, -1/4, 1/4 ],
    [ 1/8*al*bt+1/8*psi, 1/8*psi, 0, 1/4*psi, 1/8*al, 0, 1/4*al, 0, 0 ],
    [ 0, 1/8*bt*gm, 1/8*al*bt, 1/8*bt, 1/2*psi, 1/8*bt, 1/2*bt,
        -1/4*bt, -1/4*bt ],
    [ 1/8*bt*gm+1/8*psi, 0, 1/8*psi, 0, 1/8*gm, 1/4*psi, 1/4*gm, 0, 0 ],
    [ 1/16*al*bt+1/16*bt*gm+1/8*bt*psi, 1/16*bt*gm, 1/16*al*bt, 0,
        1/4*psi, 0, 1/8*bt+1/2*psi, -1/8*bt, -1/8*bt ],
    [ 1/16*bt*gm+1/16*bt*psi, 1/16*bt*gm+1/16*gm*psi, 1/16*al*psi,
        1/8*psi, 1/8*al*gm+1/8*psi, 1/8*al*bt+1/8*psi,
        -1/16*al+1/16*bt-1/16*gm+1/4*psi,
        -1/16*al-1/16*bt+1/16*gm+1/4*psi,
        1/16*al-1/16*bt-1/16*gm-1/4*psi ],
    [ 1/16*al*bt+1/16*bt*psi, 1/16*gm*psi, 1/16*al*bt+1/16*al*psi,
        1/8*bt*gm+1/8*psi, 1/8*al*gm+1/8*psi, 1/8*psi,
        -1/16*al+1/16*bt-1/16*gm+1/4*psi,
        -1/16*al-1/16*bt+1/16*gm-1/4*psi,
        1/16*al-1/16*bt-1/16*gm+1/4*psi ] ],

  [ [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, 1/4, 1/4, -1/4 ],
    [ 0, 1/2*psi, 0, 0, 0, 0, 0, 1/2, 0 ],
    [ 0, 0, 1/4*psi, 0, 1/4*gm, 1/4*bt, -1/4, 1/4, 1/4 ],
    [ 1/8*psi, 1/8*al*gm+1/8*psi, 0, 1/4*psi, 0, 1/8*al, 0, 1/4*al, 0 ],
    [ 0, 1/8*bt*gm+1/8*psi, 1/8*psi, 0, 1/4*psi, 1/8*bt, 0, 1/4*bt, 0 ],
    [ 1/8*bt*gm, 0, 1/8*al*gm, 1/8*gm, 1/8*gm, 1/2*psi, -1/4*gm,
        1/2*gm, -1/4*gm ],
    [ 1/16*bt*gm+1/16*bt*psi, 1/16*bt*gm+1/16*gm*psi, 1/16*al*psi,
        1/8*psi, 1/8*al*gm+1/8*psi, 1/8*al*bt+1/8*psi,
        -1/16*al+1/16*bt-1/16*gm+1/4*psi,
        -1/16*al-1/16*bt+1/16*gm+1/4*psi,
        1/16*al-1/16*bt-1/16*gm-1/4*psi ],
    [ 1/16*bt*gm, 1/16*al*gm+1/16*bt*gm+1/8*gm*psi, 1/16*al*gm, 0, 0,
        1/4*psi, -1/8*gm, 1/8*gm+1/2*psi, -1/8*gm ],
    [ 1/16*bt*psi, 1/16*al*gm+1/16*gm*psi, 1/16*al*gm+1/16*al*psi,
        1/8*bt*gm+1/8*psi, 1/8*psi, 1/8*al*bt+1/8*psi,
        -1/16*al+1/16*bt-1/16*gm-1/4*psi,
        -1/16*al-1/16*bt+1/16*gm+1/4*psi,
        1/16*al-1/16*bt-1/16*gm+1/4*psi ] ],

  [ [ 1/4*psi, 0, 0, 1/4*gm, 0, 1/4*al, 1/4, -1/4, 1/4 ],
    [ 0, 1/4*psi, 0, 1/4*bt, 1/4*al, 0, -1/4, 1/4, 1/4 ],
    [ 0, 0, 1/2*psi, 0, 0, 0, 0, 0, 1/2 ],
    [ 1/8*al*bt, 1/8*al*gm, 0, 1/2*psi, 1/8*al, 1/8*al, -1/4*al,
        -1/4*al, 1/2*al ],
    [ 0, 1/8*psi, 1/8*al*bt+1/8*psi, 1/8*bt, 1/4*psi, 0, 0, 0, 1/4*bt ],
    [ 1/8*psi, 0, 1/8*al*gm+1/8*psi, 1/8*gm, 0, 1/4*psi, 0, 0, 1/4*gm ],
    [ 1/16*al*bt+1/16*bt*psi, 1/16*gm*psi, 1/16*al*bt+1/16*al*psi,
        1/8*bt*gm+1/8*psi, 1/8*al*gm+1/8*psi, 1/8*psi,
        -1/16*al+1/16*bt-1/16*gm+1/4*psi,
        -1/16*al-1/16*bt+1/16*gm-1/4*psi,
        1/16*al-1/16*bt-1/16*gm+1/4*psi ],
    [ 1/16*bt*psi, 1/16*al*gm+1/16*gm*psi, 1/16*al*gm+1/16*al*psi,
        1/8*bt*gm+1/8*psi, 1/8*psi, 1/8*al*bt+1/8*psi,
        -1/16*al+1/16*bt-1/16*gm-1/4*psi,
        -1/16*al-1/16*bt+1/16*gm+1/4*psi,
        1/16*al-1/16*bt-1/16*gm+1/4*psi ],
    [ 1/16*al*bt, 1/16*al*gm, 1/16*al*bt+1/16*al*gm+1/8*al*psi,
        1/4*psi, 0, 0, -1/8*al, -1/8*al, 1/8*al+1/2*psi ] ] ];

  Gram := Matrix([ [ 1, al, gm, al, psi, gm, psi, 1/2*al*gm+1/2*psi, 1/2*al*gm+1/2*psi ], [ al, 1, bt, al, bt, psi, 1/2*al*bt+1/2*psi, psi, 1/2*al*bt+1/2*psi ], [ gm, bt, 1, psi, bt, gm, 1/2*bt*gm+1/2*psi, 1/2*bt*gm+1/2*psi, psi ], 
  [ al, al, psi, 1/2*al^2+1/2*al, 1/2*al*bt+1/2*psi, 1/2*al*gm+1/2*psi, 1/4*al*bt+1/2*al*psi+1/4*psi, 1/4*al*gm+1/2*al*psi+1/4*psi, 1/4*al*bt+1/4*al*gm+1/2*al*psi ], [ psi, bt, bt, 1/2*al*bt+1/2*psi, 1/2*bt^2+1/2*bt, 1/2*bt*gm+1/2*psi, 
      1/4*al*bt+1/4*bt*gm+1/2*bt*psi, 1/4*bt*gm+1/2*bt*psi+1/4*psi, 1/4*al*bt+1/2*bt*psi+1/4*psi ], [ gm, psi, gm, 1/2*al*gm+1/2*psi, 1/2*bt*gm+1/2*psi, 1/2*gm^2+1/2*gm, 1/4*bt*gm+1/2*gm*psi+1/4*psi, 1/4*al*gm+1/4*bt*gm+1/2*gm*psi, 
      1/4*al*gm+1/2*gm*psi+1/4*psi ], [ psi, 1/2*al*bt+1/2*psi, 1/2*bt*gm+1/2*psi, 1/4*al*bt+1/2*al*psi+1/4*psi, 1/4*al*bt+1/4*bt*gm+1/2*bt*psi, 1/4*bt*gm+1/2*gm*psi+1/4*psi, 1/8*al*bt+1/8*bt*gm+1/4*bt*psi+1/2*psi^2, 
      1/4*al*bt*gm+1/8*al*psi+1/8*bt*gm+1/8*bt*psi+1/8*gm*psi+1/4*psi^2, 1/4*al*bt*gm+1/8*al*bt+1/8*al*psi+1/8*bt*psi+1/8*gm*psi+1/4*psi^2 ], [ 1/2*al*gm+1/2*psi, psi, 1/2*bt*gm+1/2*psi, 1/4*al*gm+1/2*al*psi+1/4*psi, 
      1/4*bt*gm+1/2*bt*psi+1/4*psi, 1/4*al*gm+1/4*bt*gm+1/2*gm*psi, 1/4*al*bt*gm+1/8*al*psi+1/8*bt*gm+1/8*bt*psi+1/8*gm*psi+1/4*psi^2, 1/8*al*gm+1/8*bt*gm+1/4*gm*psi+1/2*psi^2, 
      1/4*al*bt*gm+1/8*al*gm+1/8*al*psi+1/8*bt*psi+1/8*gm*psi+1/4*psi^2 ], [ 1/2*al*gm+1/2*psi, 1/2*al*bt+1/2*psi, psi, 1/4*al*bt+1/4*al*gm+1/2*al*psi, 1/4*al*bt+1/2*bt*psi+1/4*psi, 1/4*al*gm+1/2*gm*psi+1/4*psi, 
      1/4*al*bt*gm+1/8*al*bt+1/8*al*psi+1/8*bt*psi+1/8*gm*psi+1/4*psi^2, 1/4*al*bt*gm+1/8*al*gm+1/8*al*psi+1/8*bt*psi+1/8*gm*psi+1/4*psi^2, 1/8*al*bt+1/8*al*gm+1/4*al*psi+1/2*psi^2 ] ]);

  return Algebra<F,9|mult>, Gram;
end intrinsic;

intrinsic J3gen(al, bt, gm, psi) -> AlgGen
  {

  }
  F := FieldOfFractions(Universe({al,bt,gm,psi}));
  
  A, frob := J3gen(:field:=F);
  
  FF := BaseRing(A);
  phi := hom<FF->F | [al,bt,gm,psi]>;
  
  return ChangeRing(A, F, phi), ChangeRing(frob, F, phi);
end intrinsic;

