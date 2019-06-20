dt=0.01
a=0.164
xlength=1
xNodeNum=11
dx=xlength/(xNodeNum-1)

ylength=xlength
yNodeNum=xNodeNum
dy=dx
c_x=a*dt/(dx^2)
c_y=a*dt/(dy^2)

for i=1:xNodeNum
    for j=1:yNodeNum
        thermalMatrix(i,j)=0
    end
end

for i=1:11
    thermalMatrix(i,xNodeNum)=100
    thermalMatrix(yNodeNum,i)=100
end


for time=1:10
for i=2:xNodeNum-1
    for j=2:yNodeNum-1
        thermalMatrix(i,j)=thermalMatrix(i,j) ...
           +c_x*(thermalMatrix(i,j+1)-2*thermalMatrix(i,j)+thermalMatrix(i,j-1)) ...
            +c_y*(thermalMatrix(i+1,j)-2*thermalMatrix(i,j)+thermalMatrix(i-1,j))
    end
end
end
