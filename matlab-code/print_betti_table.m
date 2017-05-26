## Copyright (C) 2017 Petar
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} print_betti_table (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Petar <petar@dubi-HP-EliteBook-Folio-1040-G3>
## Created: 2017-05-25

function [betti] = print_betti_table(d,s,mod,S,M)
  L = 0;
  
  for i = 1:length(mod)
    if length(mod{i}) > 0
      L = L+1;
    endif
  endfor
  
  betti = zeros(sum(max(M))+1,L+1);
  betti(1,1) = 1;
  
  for i = length(mod):-1:1
    for j = 1:length(mod{i})
      k = sum(multideg(S(:,mod{i}(j)),M));
      betti(k-i+1,i+1) = betti(k-i+1,i+1) + 1;
    endfor
  endfor
  
  
  printf("\\begin{matrix}\n");
  
  
  for j = 1:size(betti)(2)
    printf("& %i ",j-1);
  endfor
  printf("\\\\\n");
  printf("\\text{total}: ");
  
  for j = 1:size(betti)(2)
    printf("& %i ",sum(betti(:,j)));
  endfor
  printf("\\\\\n");
  
  for i = 1:size(betti)(1)
    printf("%i: ",i-1);
    for j = 1:size(betti)(2)
      if betti(i,j)>0
        printf("& %i ", betti(i,j));
      else
        printf("& . ");
      endif
    endfor
    if i != size(betti)(1)
      printf("\\\\");
    endif
    printf("\n");
  endfor
  
  printf("\\end{matrix}\n");
endfunction
