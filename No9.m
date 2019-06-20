totalNum=11

index=1
A(index)=0
B(index)=1
C(index)=-1
D(index)=0
finLen=10

deltaX=finLen/(totalNum-1)

b=-2

for i=2:totalNum-1
    A(i)=1
    B(i)=b
    C(i)=1
    D(i)=3*deltaX^2
end
index=totalNum
%{
A(index)=-1
B(index)=1
C(index)=0
D(index)=0
%}
A(index)=0
B(index)=1
C(index)=0
D(index)=100
%ansT是tdma算出來的解答
ansT=TDMAsolver(A,B,C,D)
%{
axisX=linspace(0,finLen,totalNum)

exactFunc=@(x) 3/2*x.^2-12.4*x+12
%公式算出來的解
exactT=exactFunc(axisX)
plot(axisX,ansT,'x',axisX,exactT,'o')
%}
