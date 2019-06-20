df=@(t,u) exp(t+u)
y=0
h=0.1
matrix(1)=1
x(1)=0
for i=2:10
   
    disp(matrix(i))
   x(i)=x(i-1)+h
   
   matrix(i)=matrix(i-1)+h*df(x(i-1),matrix(i-1))
    
    
end

plot(x,matrix)
