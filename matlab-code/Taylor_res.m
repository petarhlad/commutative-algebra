function [d,s,modules,S] = Taylor_res(M,G,S,n,r)

d = cell(1,r); % the differential maps
s = cell(1,r); % the signs of the coefficients of the differential maps
modules = cell(1,r); % the indices of the faces with dimension r

[facets, faces, ~] = find(G);


mod_dim = sum(S,1);

for i = 1:r
  modules{i} = find(mod_dim == i);
  if i == 1
    rows = 1;
  else
    rows = length(modules{i-1});
  endif
  d{i} = zeros(rows,length(modules{i}),n);
  s{i} = zeros(rows,length(modules{i}));
endfor

for i = 2:2**r

  face = S(:,i);
  dim = sum(face);
  
  if dim > 0
    col = find(modules{dim}==i); % the index of the face in the set of faces of same dimension
    fcts = facets(find(faces==i)); % the facets of the face
    
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

endfunction