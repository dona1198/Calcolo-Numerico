function[B]=calcolobaseIm(A)
%funzione per calcolare una base di Im(A)
  A = riduzionescalini(A);
  B = [];
  colonna = 1;
  for riga = 1:(size(A,1))
	  if(colonna <= size(A,2))
		  while(A(riga, colonna) == 0 && colonna < size(A,2))
		   colonna = colonna + 1;
	    end
	    if(A(riga, colonna) != 0)
        B = [B A(:, colonna)]; % aggiunta di una nuova colonna
		    colonna = colonna + 1;
	    end
  end
end