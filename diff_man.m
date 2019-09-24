clc;
clear all;
close all;

bits=[1 1 1 0 0 1 0 1];
L=length(bits);

n=500;
h=n/2;
dt=1/n;
x=0:dt:L;

y=ones(1,length(x));

sign=1;

for i=0:L-1
  if(bits(i+1)==1)
    sign=sign*-1;
  end
  y((i*n+1):(i*n+h))=-sign;
  y((i*n+h+1):(i+1)*n)=sign;
end
plot(x,y);
axis([0 x(end) -4 4]);
grid on;

size=length(y);
len=floor(size/L);
decode=zeros(1,L);
sign=-1;

for i=0:L-1
  if(y(i*len+1))~=sign
    sign=sign*-1;
    decode(i+1)=1;
  end
 
end
disp(decode);


