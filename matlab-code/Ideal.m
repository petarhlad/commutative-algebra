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
## @deftypefn {Function File} {@var{retval} =} Ideal (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Petar <petar@dubi-HP-EliteBook-Folio-1040-G3>
## Created: 2017-05-19

function [G,M,S,n,r] = Ideal()

n = 5; % Number of variables (x_1, ..., x_n)

r = 4; % Number of monomial generators of the ideal

% The matrix with the exponents of the monomial generators. The size is r*n.

%M = [  
%4 0 0 0 0 0 0
%0 4 0 0 0 0 0
%0 2 2 0 0 0 0
%0 0 4 0 0 0 0
%0 0 0 4 0 0 0
%1 0 0 2 1 0 0
%0 0 0 0 4 0 0
%0 2 0 0 0 2 0
%0 0 0 0 0 4 0
%0 0 0 2 0 0 2
%0 0 0 0 0 0 4
%]

%M = [  
%1 1 0 0 0
%0 1 1 0 0
%0 0 1 1 0
%0 0 0 1 1
%]

M = [
2 0 0
1 1 0
0 3 1
]

M = M([2 1 3],:)

r = size(M)(1);
n = size(M)(2);

D = [0:2^r-1]';
S = rem(floor(D*pow2(-(r-1):0)),2)'; %this creates the lattice S = {0,1}^r

G = zeros(2**r,2**r);

for i = 1:2**r
  for j = find(1-S(:,i)')
    G(i,i+2**(r-j)) = 1;
  endfor
endfor


endfunction