%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%forth order boundary scheme
parameter=[1 1 1 1 1 0;
   0 1 2 3 4 -1;
   0 1 4 9 16 -2;
   0 1 8 27 64 -3;
   0 1 16 81 256 -4;
   0 1 32 243 1024 -5;]
b=[0;1;0;0;0;0]

a=parameter\b


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
C(index)=a(6)
D(index)=(a(1)*givenPoint(index)+a(2)*givenPoint(index+1) ...
+a(3)*givenPoint(index+2)+a(4)*givenPoint(index+3)+a(5)*givenPoint(index+4))/h



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
A(index)=a(6)
B(index)=1
C(index)=0
D(index)=-1*(a(1)*givenPoint(index)+a(2)*givenPoint(index-1) ...
+a(3)*givenPoint(index-2)+a(4)*givenPoint(index-3)+a(5)*givenPoint(index-4))/h


%ansT是tdma算出來的解答
ansT=TDMAsolver(A,B,C,D)



%公式算出來的解
exactT=fderivation(x)
plot(x,ansT,'x',x,exactT,'o')