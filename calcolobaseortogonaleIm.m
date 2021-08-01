function[E]=calcolobaseortogonaleIm(A)
%funzione per calcolare una base dell'ortogonale di Im(A)
  B = A'; %ricaviamo trasposta di A
  B = [B zeros(size(B,1), 1)]; % aggiunta di una nuova colonna con soli 0
  C = riduzionescalini(B);
  D = -colonnelibere(C);
  posizioni = calcoloposizioni(C);
  C(:,size(C, 2))=[]; %eliminazione ultima colonna nulla
  ind = size(posizioni, 1);
  i = size(C, 2);
  while(i >= 1 && ind>=1) %eliminazione colonne libere
    if( i == posizioni(ind,1))
      C(:,i)=[];
      ind--;
    end
    i--;
  end
  C = [C D]; %reinserimento col libere cambiate di segno nelle ultime colonne
  i = size(C, 1);
  while(i >= 1 && C(i, :) == zeros(1, size(C,2))) %eliminazione righe nulle
    C(size(C, 1),:)=[];
    i--;
  end
  n = calcolorango(C);
  for(i = size(C, 1):-1:1) %calcolo della base dell'ortogonale di Im(A)
    j = 1;
    while(C(i, j) == 0 && j < n)
      j = j +1;
    end
    if(j == n)
      for(colonna = j + 1:size(C, 2))
        C(i, colonna) = C(i, colonna)/C(i, i);
      end
    else
      for(colonna = n + 1:size(C, 2))
        provv = 0;
        col2 = n;
        for(riga = size(C, 1):-1:i+1)
          provv += -(C(riga, colonna)*C(i, col2));
          col2 = col2 - 1;
        end
        C(i, colonna) = (C(i, colonna) + provv)/C(i, i);
      end
    end
  end
  F = [];
  for( i = n+1:size(C, 2)) %estrazione basi calcolate in C
    F = [F C(:, i)];
  end
  E = [];
  diagonale = eye(size(posizioni, 1), size(posizioni, 1));
  p = 0;
  i = 1;
  ind = 1;
  while(i <= (size(F,1) + size(posizioni,1))) %ordinamento secondo posizioni opportune
    p++;
    if( ind <= size(posizioni,1) && p == posizioni(ind,1))
      E = [E; diagonale(ind, :)];
      ind++;
    else
      if( i <= size(F,1))
        E = [E; F(i, :)];
      end
      i++;
    end
end