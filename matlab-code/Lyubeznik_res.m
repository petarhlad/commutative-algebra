function [d,s,modules,S,G] = Lyubeznik_res(M,G,S,n,r)

d = cell(1,r); % the differential maps
s = cell(1,r); % the signs of the coefficients of the differential maps
modules = cell(1,r); % the indices of the faces with dimension r
pruned = zeros(1,size(S)(2)); %the indices of the faces that will be removed

[facets, faces, ~] = find(G);

% Beginning of pruning

for i = 1:r
  for j = 1:size(S)(2)
    if pruned(j) == 0 % The face j has survived after step i-1
      face = S(:,j);
      if all(face(1:i) == 0) % face_i = 0 for all j<=i
        f = face;
        f(i) = 1;
        iface2 = find(ismember(S',f','rows'));
        if pruned(iface2) == 0 % The edge face->f has survived after step i-1
          if all(multideg(face,M) == multideg(S(:,iface2),M)) % The multidegrees of 'face' and 'f' match
            % prune the edge and remove the two faces
            pruned(j) = 1; 
            pruned(iface2) = 1;
          endif
        endif
      endif
    endif
  endfor
endfor

ipruned = find(pruned);

% remove the faces we don't need.

G(ipruned,:) = [];
G(:,ipruned) = [];
S(:,ipruned) = [];

% End of pruning

[facets, faces, ~] = find(G);

mod_dim = sum(S,1).*(sum(G,1)!=0);

for i = 1:r
  % free modules associated to faces of dimension i-1
  modules{i} = find(mod_dim == i);
  
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