%M is the set of generators of the monomial ideal I in the polinomial ring of n indeterminates.
%The i-eth row of M (M_{i,1}, ..., M_{i,n}) represents the monomial X_{1}^{M_{i,1}} · ... · X_{n}^{M{i,n}}.
%
%To run an example, define M with the exponents of each monomial of the generating set in each row.

%% Example with I = (x_1 x_2, x_2 x_3, x_3 x_4, x_4 x_5)
%M = [
%1 1 0 0 0
%0 1 1 0 0
%0 0 1 1 0
%0 0 0 1 1
%];


%% Example 4.3 from Pruned Cellular Free resolutions of monomial ideals
%% This example may need few seconds to run
M = [
4 0 0 0 0 0 0
0 4 0 0 0 0 0
0 2 2 0 0 0 0
0 0 4 0 0 0 0
0 0 0 4 0 0 0
1 0 0 2 1 0 0
0 0 0 0 4 0 0
0 2 0 0 0 2 0
0 0 0 0 0 4 0
0 0 0 2 0 0 2
0 0 0 0 0 0 4
];


[G,S,n,r] = Ideal(M);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Taylor resolution of I=(M)

[d1,s1,modules1,S1] = Taylor_res(M,G,S,n,r);

%% Uncomment to print the resolution with description of the differential maps
%printf("%% Taylor Resolution\n\n");
%print_resolution(d1,s1,modules1,S1,M);

printf("\n\n%% Taylor Resolution Betti table\n\n");
betti = print_betti_table(d1,s1,modules1,S1,M);
printf("\n\n");



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lyubeznik resolution of I=(M)

[d2,s2,modules2,S2,G2] = Lyubeznik_res(M,G,S,n,r);

%% Uncomment to print the resolution with description of the differential maps
%printf("%% Lybeznik Resolution\n\n");
%print_resolution(d2,s2,modules2,S2,M);

printf("\n\n%% Lyubeznik Resolution Betti table\n\n");
betti = print_betti_table(d2,s2,modules2,S2,M);
printf("\n\n");



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pruned Taylor resolution of I=(M)

[d3,s3,modules3,S3] = Pruned_Taylor_res(M,G,S,n,r);

%% Uncomemnt to print the resolution with description of the differential maps
%printf("%% Pruned Taylor Resolution\n\n");
%print_resolution(d3,s3,modules3,S3,M);

printf("\n\n%% Pruned Taylor Resolution Betti table\n\n");
betti = print_betti_table(d3,s3,modules3,S3,M);
printf("\n\n");