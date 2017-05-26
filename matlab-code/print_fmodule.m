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
## @deftypefn {Function File} {@var{retval} =} print_fmodule (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Petar <petar@dubi-HP-EliteBook-Folio-1040-G3>
## Created: 2017-05-19

function [] = print_fmodule (S,M)
n = size(M)(2);
  printf("\\begin{matrix}\n");
  for s = S
    printf("R \\lbrack ");
    m = multideg(s,M);
    ii = find(m);
    for i = ii
      printf("x_{%i}",i);
      if m(i) != 1
        printf("^{%i}",m(i));
      endif
    endfor
    printf(" \\rbrack ");
    if !all(s == S(:,end))
      printf("\\\\ \\bigoplus \\\\");
    endif
    printf("\n");
    
  endfor
  printf("\\end{matrix}\n");
endfunction
