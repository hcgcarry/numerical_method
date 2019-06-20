a=[1 3 2 1;
   4 2 1 2;
   2 1 2 3;
   1 2 4 1;]
b=[-2;2;1;-1]
exactX=a\b

%lu
[L,U]=lu_nopivot(a)

Y=L\b
LU_X=U\Y