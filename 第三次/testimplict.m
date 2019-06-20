dt=1
a=164
xlength=1
xNodeNum=11
dx=xlength/(xNodeNum-1)

ylength=xlength
yNodeNum=xNodeNum
dy=dx
for i=1:xNodeNum
    for j=1:yNodeNum
        thermalMatrix(i,j)=0
    end
end

for i=1:11
    thermalMatrix(i,xNodeNum)=100
    thermalMatrix(yNodeNum,i)=100
end
c_x=a*dt/(dx^2)
c_y=a*dt/(dy^2)


for i=2:10
    index=1
    A(index)=0
    B(index)=1
    C(index)=0
    D(index)=0
    for j=2:10
      
        A(j)=c_x
        B(j)=-1-2*c_x-2*c_y
        C(j)=c_x
        
        D(j)=-1*thermalMatrix(i,j)-1/dy^2*(thermalMatrix(i+1,j)+thermalMatrix(i-1,j))
      
    end
   index=xNodeNum
    A(index)=0
    B(index)=1
    C(index)=0
    D(index)=100
  
  %%%%%%%%%%%%%%tdma
    %ansT是tdma算出來的解答
    ansT=TDMAsolver(A,B,C,D)
    
    
    for k=2:xNodeNum-1
        thermalMatrix(i,k)=ansT(k)
        disp(ansT)
        
    end
end



