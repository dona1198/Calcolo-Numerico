function[A]=riduzionescalini(A)
%funzione per la riduzione a scalini di una matrice
	colonna=0;
	for riga=1:(size(A,1)-1)
    if(colonna < (size(A,2)))
      colonna=colonna+1;
      while( (colonna < (size(A,2))) && (A(riga,colonna) == 0) &&  
         (A(riga,colonna+1) == 0) &&
          (controllacolonna(A, riga+1, colonna) == 0))
            colonna=colonna+1;
      end
		  if(A(riga,colonna) == 0)
		    if(colonna != size(A,2) && A(riga,colonna + 1) != 0)
          if(controllacolonna(A, riga+1, colonna) == 0)
          %caso in cui elemento pivotale nullo, nulli tutti gli 
          %elementi sottostanti ma non subito a destra dell'elemento
          %pivotale corrente
            colonna=colonna+1;
          elseif (A(riga + 1,colonna) != 0)
          %caso in cui elemento pivotale nullo, quello subito a destra
          %dell'elemento pivotale corrente non è nullo ma l'elemento 
          %sottostante al pivot corrente non è nullo
            temp = A(riga , :);
            A(riga, :) = A(riga + 1, :);
		    	  A(riga + 1, :) = temp;
          else
          %caso in cui elemento pivotale nullo, quello subito a destra
          %dell'elemento pivotale corrente non è nullo,l'elemento 
          %sottostante al pivot corrente è nullo ma non tutti gli 
          %elementi sottostanti
            A = controllorigheinferiori(A, riga, colonna);
          end
		    else
       %caso in cui elemento pivotale nullo, quello subito a destra
       %dell'elemento pivotale corrente è anche nullo, e bisogna
       %effettuare uno switch della riga corrente con una sottostante
       %cercando il primo elemento sottostante non nullo
		      A = controllorigheinferiori(A, riga, colonna);
	     end
     end
     %riduzione a scalini
     if((riga + 1 == size(A, 1)) && (colonna == size(A, 2)))
        A(riga + 1, colonna) = 0;
     else
	   M=A(riga+1:size(A,1), 1:1);
	    x=riga+1;
	    for m=1:size(M,1)
	   	M(m)=-(A(x,colonna)/A(riga,colonna)); %calcolo moltiplicatore di Gauss
	  	  x=x+1;
	    end
	    for z=riga+1:size(A,1)
	    	A(z,colonna)=0;
	    end
	    m=0;
	    for a=riga+1:size(A,1)
	    	m=m+1;
	    	for b=colonna+1:size(A,2)
	  	  	A(a,b)=A(a,b)+(M(m)*A(riga,b)); %calcolo nuova riga
	  	  end
	    end
    end
   end
end