
%syms x
%simpsonFunc=inline('exp(x)')
simpsonFunc=@(x) 1./(1+x.^2)
a=1
b=6
c=(b+a)/2
h31=(b-a)/2
simpson31=1/3*h31*(simpsonFunc(a)+simpsonFunc(b)+4*simpsonFunc(c))
xi=(b-a)/3
xipluse1=(b-a)*2/3
h83=(b-a)/3
simpson83=3/8*h83*(simpsonFunc(a)+3*simpsonFunc(xi)+3*simpsonFunc(xipluse1)+simpsonFunc(b))

%exact value

quadlValue=quadl(simpsonFunc,a,b)
quadValue=quad(simpsonFunc,a,b)


