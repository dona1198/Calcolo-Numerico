function[ris]=controllacolonna(A, riga, colonna)
%funzione che restituisce true (0) se la colonna ha solo elementi nulli,
%mentre restituisce false (1) se ha anche solo un elemento non nullo
  x = 0;
  for( i = riga : size(A,1))
    if(A(i,colonna) != 0)
      x = x + 1;
    end
  end
  if( x == 0 ) ris = 0;
  else ris = 1;
  end
end