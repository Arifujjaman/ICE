clc;
close all;
clear;

bitstream = [1 1 0 0 1];
L = length(bitstream);


n = 500;
nhalf=n/2;
dt = 1/n;
x = 0:dt:L;

previous=input('previous voltage');

sign = previous;


y = ones(1, length(x));

for i=0 : L-1
    if(bitstream(i+1)==1) 
      sign=sign*-1; 
    end
    y((i*n+1):(i*n+nhalf))=sign;
    y((i*n+nhalf+1):(i+1)*n)=-sign;
           
end

plot(x, y, 'r');
axis([0 x(end) -4 4]);
grid on;

xlabel('Time');
ylabel('Voltage');

size=length(y);
len=floor(size/L);
decode=zeros(1,L);
sign=previous;
for i=0:L-1
  if(y(i*len+1)~=sign)
    sign=sign*-1;
    decode(i+1)=1;
  end
end
disp(decode);


