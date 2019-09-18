clc;
close all;
clear;

bitstream = [1 1 0 0 1];
L = length(bitstream);

n = 500;
dt = 1/n;
x = 0:dt:L;

y = ones(1, length(x));

for i=0 : L-1
    if(bitstream(i+1)==0)
      y((i*n+1):(i+1)*n)=0; 
    end    
end

plot(x, y, 'r');
axis([0 x(end) -4 4]);
grid on;

xlabel('Time');
ylabel('Voltage');

size=length(y);
len=floor(size/L);
decode=zeros(1,L);

for i=0:L-1
  if(y(i*len+1)==1)
    decode(i+1)=1;
  end
end
disp(decode);


