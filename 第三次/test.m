%%adam 推導(更正formula得不同結果)
x=[0 1 3 4 7]
y=[9.31 7.99 5.78 5.88 5.51]
ybar=x.*y

sigxy=dot(x,ybar)
m=5
sigx=sum(x)
sumXSquar=0
sigy=sum(ybar)
for i=1:m
    sumXSquar=sumXSquar+x(i)^2
end


A=[sumXSquar sigx;sigx m]
b=[sigxy;sigy]
ans=A\b

f=@(x) ans(1)*x+ans(2)
ansfinal=f(x)

yMean=sigy/m
s0=0
s=0
for i=1:m
    s0=s0+(ybar(i)-yMean)^2
    s=s+(f(x(i))-ybar(i))^2
end
rSquare=(s0-s)/s0