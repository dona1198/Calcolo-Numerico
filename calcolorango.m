function[rank]=calcolorango(A)
%funzione per calcolare il rango di una matrice
  A = riduzionescalini(A);
  colonna = 1;
  rank = 0;
  for riga = 1:(size(A,1))
	  if(colonna <= size(A,2))
		  while(A(riga, colonna) == 0 && colonna < size(A,2))
		   colonna = colonna + 1;
	    end
	    if(A(riga, colonna) != 0)
		    rank = rank + 1;
		    colonna = colonna + 1;
	    end
  end
end