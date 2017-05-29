function [d,s,modules] = Scarf_complex(M,G,S,n,r)

d = cell(1,r); % the differential maps
s = cell(1,r); % the signs of the coefficients of the differential maps
modules = cell(1,r); % the indices of the faces with dimension r
pruned = zeros(1,2**r);

for i = 1:2**r
    if pruned(i) == 0
      for j = (i+1):2**r
        if all(multideg(S(:,i),M) == multideg(S(:,j),M))
          pruned(i) = 1;
          pruned(j) = 1;
        endif
      endfor
    endif
endfor
ipruned = find(pruned);

G(ipruned,:) = [];
G(:,ipruned) = [];
S(:,ipruned) = [];

[facets, faces, ~] = find(G);

for i = 1:r
  modules{i} = find((sum(S,1)==i).*(sum(G,1)!=0));
  if i == 1
    rows = 1;
  else
    rows = length(modules{i-1});
  endif
  d{i} = zeros(rows,length(modules{i}),n);
  s{i} = zeros(rows,length(modules{i}));
endfor

for i = 2:size(S)(2)

  face = S(:,i);
  dim = sum(face);
  
  if dim > 0
    col = find(modules{dim}==i);
    fcts = facets(find(faces==i));
    
    if dim == 1
      s{dim}(1,col) = 1;
      d{dim}(1,col,:) = multideg(face,M);
    else
      for j = 1:length(fcts)
        facet = S(:,fcts(j));
        row = find(modules{dim-1}==fcts(j));
        s{dim}(row,col) = (-1)**(j+1);
        d{dim}(row,col,:) = multideg(face,M) - multideg(facet,M);
      endfor
    endif
  endif
endfor

printf("%% Scarf complex\n\n");

print_resolution(d,s,modules,S,M);

printf("\n\n");

endfunction