function[A]=controllorigheinferiori(A, riga, colonna)
%funzione per ricercare una riga inferiore con cui effettuare swap
%durante riduzione a scalini
  b = 0;
  z = riga + 1;
  while( b == 0 && z <= size(A,1) )
    if( A(z, colonna) != 0)
      b = z;
    end
    z++;
  end
  for (i = b:-1:riga + 1)
    if((A(i, colonna) != 0) && (A(i - 1, colonna) == 0))
      temp = A(i , :);
      A(i, :) = A(i - 1, :);
		  A(i - 1, :) = temp;
    end
  endfor
end