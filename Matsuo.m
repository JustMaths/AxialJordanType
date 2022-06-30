/*

Matsuo algebras

*/
// L is lower triangular sequence of sequences.
function MakeSymmetric(L)
  M := L;
  for i in [1..#L], j in [i+1..#L] do
    M[i,j] := M[j,i];
  end for;
  
  return M;
end function;


intrinsic MatsuoAlgebra(G::Grp, D::Set, eta::FldElt) -> AlgGen, AlgMat, SetIndx
  {
  Suppose G is a group and D is a set of involutions such that (G, D^G) is a 3-transposition group.  Returns the Matsuo algebra M_eta(G,D) together with the Frobenius form and the set D^G which corresponds to the axes.
  }
  require D subset G: "The set D must be a set of elements of G.";
  require forall{ d : d in D | Order(d) eq 2}: "The set D must be a set of involutions.";
  require forall{ <d,e> : d,e in D | Order(d*e) le 3}: "The set D must be a set of 3-transpositions";
  
  require sub<G|OrbitClosure(G,D)> eq G: "D must generate G";
  require eta notin {0,1}: "eta cannot be 0, or 1";
  
  axes := OrbitClosure(G, D);
  F := FieldOfFractions(Parent(eta));
  V := VectorSpace(F, #axes);
  
  mult := [[V|] : i in [1..#axes]];
  frob := [[F|] : i in [1..#axes]];
  for i in [1..#axes] do
    for j in [1..i] do
      ord := Order(axes[i]*axes[j]);
      if ord eq 1 then
        assert i eq j;
        mult[i,j] := V.i;
        frob[i,j] := F!1;
      elif ord eq 2 then
        mult[i,j] := V!0;
        frob[i,j] := 0;
      else
        assert ord eq 3;
        pos := Position(axes, axes[i]^axes[j]);
        mult[i,j] := eta/2*(V.i+V.j-V.pos);
        frob[i,j] := eta/2;
      end if;
    end for;
  end for;
  
  mult := MakeSymmetric(mult);
  frob := Matrix(MakeSymmetric(frob));
  
  return Algebra<F, #axes | mult>, frob, axes;
end intrinsic;

intrinsic MatsuoAlgebra(RtSys::MonStgElt, eta::FldRatElt) -> AlgGen, AlgMat, SetIndx
  {
    Matsuo algebra for a Coxeter group of a give root system.
  }
  G := CoxeterGroup(RtSys);
  inv := [ x[3] : x in ConjugacyClasses(G) | x[1] eq 2 ];
  inv := [ x : x in inv | NormalClosure(G, sub<G|x>) eq G ];
  inv := [ x : x in inv | 
    forall{ y : y in OrbitClosure(G, {x}) | Order(x*y) le 3 } ];
  M := [];
  f := [];
  for x in inv do
    a,b := MatsuoAlgebra(G, {x}, eta);
    Append(~M, a);
    Append(~f, b);
  end for;
  return M, f;
end intrinsic;
