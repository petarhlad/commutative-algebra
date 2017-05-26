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
## @deftypefn {Function File} {@var{retval} =} print_free_resolution (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Petar <petar@dubi-HP-EliteBook-Folio-1040-G3>
## Created: 2017-05-25

function [] = print_free_resolution(d,s,mod,S,M)

printf("0 \\rightarrow ");


for i = length(mod):-1:1
  if length(mod{i})>0
    betti = zeros(1,sum(max(M)));
    for j = 1:length(mod{i})
      k = sum(multideg(S(:,mod{i}(j)),M));
      betti(k) = betti(k) + 1;
    endfor
    
    printf("\\begin{matrix}\n");
    
    for j = find(betti)
      printf("R^{%i}(-%i)",betti(j),j);
      if j != find(betti)(end)
        printf("\\\\ \\bigoplus \\\\");
      endif
      printf("\n");
      
    endfor
    printf("\\end{matrix}\n");

    printf("\\rightarrow");
  endif
endfor

printf(" R/I \\rightarrow 0\n");

endfunction
