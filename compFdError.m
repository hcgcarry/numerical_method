function [S1_FD_Error,S1_BD_Error,S1_CD_Error,S2_FD_Error]=compFdError(N)


NF = N-1;

X  = [0:1:N-1]/(N-1)*2*pi;

DX = X(2)-X(1);
%%%%%%
F = sin(5*X);
DFDX = @(x) 5*cos(5*x);
%%%%%%

for j=1:N
    if j+1>N
        S1_FD(j) = (F(1)-F(j))/DX;
    else
        S1_FD(j) = (F(j+1)-F(j))/DX;
    end
    if j-1<1
        S1_BD(j) = (F(j)-F(N))/DX;
    else
        S1_BD(j) = (F(j)-F(j-1))/DX;
    end
    if j-1<1
        S1_CD(j) = (F(j+1)-F(N))/(2*DX);
    elseif j+1>N
        S1_CD(j) = (F(1)-F(j-1))/(2*DX);
    else
        S1_CD(j) = (F(j+1)-F(j-1))/(2*DX);
    end
end

%%%%%%%%%%%%%%%% Pade scheme %%%%%%%%%%%%%%%%%%%%%
for j=1:N
    if j==1
    a(j) = 0;
    b(j) = 1;
    c(j) = 2;
    d(j) = -2.5*F(1)+2*F(2)+0.5*F(3);
    elseif j==N
    a(j) = 2;
    b(j) = 1;
    c(j) = 0;
    d(j) = +2.5*F(N)-2*F(N-1)-0.5*F(N-2);
    else
    a(j) = 1;
    b(j) = 4;
    c(j) = 1;
    d(j) = 3*(F(j+1)-F(j-1))
    end
end
d=d./DX;
S2_FD=TDMAsolver(a,b,c,d);

exact_value=DFDX(X)
disp(exact_value)
%{
plot(X,DFDX,'-',X,S1_FD,'o',X,S1_BD,'x',X,S1_CD,'d',X,S2_FD,'ks');
legend('Exact','FD','BD','CD','Pade')
%}
S1_FD_Error_array=exact_value-S1_FD
disp(S1_FD_Error_array)
S1_BD_Error_array=exact_value-S1_BD
S1_CD_Error_array=exact_value-S1_CD
S2_FD_Error_array=exact_value-S2_FD

S1_FD_Error=0
S1_BD_Error=0
S1_CD_Error=0
S2_FD_Error=0
for i=1:N
    S1_FD_Error=+S1_FD_Error_array(i)
    S1_BD_Error=+S1_BD_Error_array(i)
    S1_CD_Error=+S1_CD_Error_array(i)
    S2_FD_Error=+S2_FD_Error_array(i)
end

S1_FD_Error=S1_FD_Error/N
S1_BD_Error=S1_BD_Error/N
S1_CD_Error=S1_CD_Error/N
S2_FD_Error=S2_FD_Error/N

end
