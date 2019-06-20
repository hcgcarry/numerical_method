totalNum=21

index=1
A(index)=0
B(index)=1
C(index)=0
D(index)=1
finLen=1

deltaX=finLen/(totalNum-1)
m=1
b=-(2+m^2*deltaX^2)

for i=2:totalNum-1
    A(i)=1
    B(i)=b
    C(i)=1
    D(i)=0
end
index=totalNum
%{
A(index)=-1
B(index)=1
C(index)=0
D(index)=0
%}
A(index)=2
B(index)=b
C(index)=0
D(index)=0
%ansT是tdma算出來的解答
ansT=TDMAsolver(A,B,C,D)
axisX=linspace(0,finLen,totalNum)

exactFunc=@(x) (1-exp(1)/(exp(1)+exp(-1)))*exp(x)+(exp(1)/(exp(1)+exp(-1)))*exp(-x)
%公式算出來的解
exactT=exactFunc(axisX)
plot(axisX,ansT,'x',axisX,exactT,'o')

