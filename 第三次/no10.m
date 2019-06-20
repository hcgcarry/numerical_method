f=@(x) cos(3*x)+cos(6*x)
fderivation=@(x) -3*sin(3*x)-6*sin(6*x)
totalNum=210
leftBound=0
rightBound=2*3.14
x=linspace(leftBound,rightBound,totalNum)


for i=1:totalNum
    givenPoint(i)=f(x(i))
end

h=(rightBound-leftBound)/(totalNum-1)


index=1
A(index)=0
B(index)=1
C(index)=2
D(index)=(-5/2*givenPoint(1)+2*givenPoint(2)+1/2*givenPoint(3))/h


for i=2:totalNum-1
    A(i)=1
    B(i)=4
    C(i)=1
    D(i)=3/h*(givenPoint(i+1)-givenPoint(i-1))
end
index=totalNum
%{
A(index)=-1
B(index)=1
C(index)=0
D(index)=0
%}
A(index)=2
B(index)=1
C(index)=0
D(index)=(5/2*givenPoint(index)-2*givenPoint(index-1)-1/2*givenPoint(index-2))/h


%ansT是tdma算出來的解答
ansT=TDMAsolver(A,B,C,D)



%公式算出來的解
exactT=fderivation(x)
plot(x,ansT,'x',x,exactT,'o')