clc;
close all;
clear;

bitstream = [1 1 0 0 1];
L = length(bitstream);

n = 500;
dt = 1/n;
x = 0:dt:L;

y = zeros(1, length(x));
sign=-1;

for i=0 : L-1
    if(bitstream(i+1)==1)
       sign=sign*-1;
       y((i*n+1):(i+1)*n)=sign; 
    end    
end

plot(x, y, 'r');
axis([0 x(end) -4 4]);
grid on;

xlabel('Time');
ylabel('Voltage');

size=length(y);
len=floor(size/L);
decode=ones(1,L);

for i=0:L-1
  if(y(i*len+1)==0)
    decode(i+1)=0;
  end
end
disp(decode);


