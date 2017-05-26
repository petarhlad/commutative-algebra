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
## @deftypefn {Function File} {@var{retval} =} print_matrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Petar <petar@dubi-HP-EliteBook-Folio-1040-G3>
## Created: 2017-05-19

function [] = print_matrix (d, s)

printf("\\left( \\begin{matrix} \n");

[r,c,n] = size(d);

for j=1:r
  for k=1:c
    if s(j,k) == 0
      printf('0')
    else
      coef = d(j,k,:);
      if s(j,k) == -1
        printf('-');
      endif
      
      
      if all(coef==0)
          printf("1");
      else
        for l=1:n
          if coef(l) != 0
            printf("x_{%i}",l);
            if coef(l) != 1
              printf("^{%i}",coef(l));
            endif
          endif
        endfor
      endif
    endif
    
    if k!=c
      printf(" & ");
    endif
  endfor
  if j!=r
    printf(" \\\\");
  endif
  printf("\n");
endfor

printf("\\end{matrix} \\right)");

endfunction
