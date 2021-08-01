function[B]=calcoloposizioni(A)
%funzione per restituire le posizioni delle colonne libere durante 
%il calcolo di una base dell'ortogonale di Im(A)
  B = [];
  firsttime = 0;
  colonna = 1;
  riga = 1;
  while (riga <=size(A,1))
	  if(colonna < size(A,2))
	    if(A(riga, colonna) != 0)
        colonna = colonna + 1;
        riga = riga + 1;
	    else
        while(A(riga, colonna) == 0 && colonna < size(A, 2))
          B = [B; colonna];
          colonna = colonna + 1;
        end
        while(riga == size(A,1) && A(riga, colonna) != 0 && 
          colonna < size(A, 2))
          if( firsttime == 0 )
            colonna = colonna + 1;
            firsttime = 1;
          else
            B = [B; colonna];
            colonna = colonna + 1;
          end
        end
        colonna = colonna + 1;
        riga = riga + 1;
      end
    else
      riga = riga + 1;
    end
  end
end