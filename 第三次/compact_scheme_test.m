x=linspace(0,2*3.14,100)
func1=@(x) cos(2*x)
func2=@(x) cos(4*x)
y1=func1(x)
y2=func2(x)
plot(x,y1,'o',x,y2,'x')
