clear all; close all
minNum=10
maxNum=100
nodeNum=maxNum-minNum+1
FDError=zeros(1,nodeNum)
BDError=zeros(1,nodeNum)
CDError=zeros(1,nodeNum)
PDError=zeros(1,nodeNum)

for i=1:nodeNum
    
  [FDError(i),BDError(i),CDError(i),PDError(i)]= compFdError(i+9)
end
axisX=10:100
plot(axisX,FDError,'x',axisX,BDError,'-',axisX,CDError,'o',axisX,PDError,'ks')
legend('FD','BD','CD','PD')
