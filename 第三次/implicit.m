dt=1
a=0.164
xLen=1
xNodeNum=11
dx=xLen/(xNodeNum-1)

yLen=xLen
yNodeNum=xNodeNum
dy=dx

c_x=a*dt/(dx^2)
c_y=a*dt/(dy^2)


for i=1:11
    %%%%%%x=1 T(x)=100
    thermal2D(i,xNodeNum)=100
    %%%%%%y=1 T(y)=100
    thermal2D(yNodeNum,i)=100
end


for time=1:10
    
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

            D(j)=-1*thermal2D(i,j)-c_y*(thermal2D(i+1,j)+thermal2D(i-1,j))
            tracejm1(i,j)=thermal2D(i,j)
            tracejp1(i,j)=thermal2D(i,j+1)
            trace(i)=D(j)
        end
       index=xNodeNum
        A(index)=0
        B(index)=1
        C(index)=0
        D(index)=100
        disp(A)
        disp(B)
        disp(C)
        disp(D)
      %%%%%%%%%%%%%%tdma
        %ansT是tdma算出來的解答
        ansT=TDMAsolver(A,B,C,D)


        for k=2:xNodeNum-1
            thermal2D(i,k)=ansT(k)
            disp(ansT)

        end
    end
    tempMatrix=thermal2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%y的
    for j=2:yNodeNum-1
        index=1
        A(index)=0
        B(index)=1
        C(index)=0
        
        %%%y=0 T(y)=0
        D(index)=0
        for i=2:xNodeNum-1

            A(i)=c_y
            B(i)=-1-2*c_y-2*c_x
            C(i)=c_y
            D(i)=-1*thermal2D(i,j)-c_x*(thermal2D(i,j+1)+thermal2D(i,j-1))
        end
       index=yNodeNum
        A(index)=0
        B(index)=1
        C(index)=0
        %y=1 T(y)=100
        D(index)=100

      %%%%%%%%%%%%%%tdma
        %ansT是tdma算出來的解答
        ansT=TDMAsolver(A,B,C,D)


        for s=2:yNodeNum-1   
            thermal2D(s,j)=ansT(s)
        end

    end

end
