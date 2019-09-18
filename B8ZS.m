clc;
close all;
clear;

%bitstream = [0 1 0 0 1 1 0 0 0 1 1];
%bitstream = [0 1 0 0 1 1];
%bitstream = [1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
bitstream = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1];

L = length(bitstream);

n = 500;
dt = 1/n;

x = 0:dt:L;
y = zeros(1, length(x));
i = 0;

while i<L
  cnt=0;
  j=i;
  while j<L && j<i+8
    if(bitstream(j+1)==0)
      cnt=cnt+1;
    else
      break;
    end  
    j=j+1;
  end
  if(cnt==8)
    bitstream(i+4)=2;
    bitstream(i+5)=3;
    bitstream(i+7)=2;
    bitstream(i+8)=3;
  
    i=i+7;
  end
  i=i+1;
end
sign=-1;
for i=0:L-1
  if(bitstream(i+1)==2)
    y((i*n+1):(i+1)*n)=sign;
  end
  
  if(bitstream(i+1)==1 || bitstream(i+1)==3)
    sign=sign*-1;
    y((i*n+1):(i+1)*n)=sign;
  end
  
end
plot(x, y, 'r');
axis([0 x(end) -4 4]);
grid on;

size = length(y);
len = floor(size/L);
decoded = zeros(1, L);

sign = -1;
i = 0;

while(i<L)
    if(y(i*len+1)==0)
        
    elseif(y(i*len+1)==sign)
        decoded(i+1) = 0;
        decoded(i-2) = 0;
    else
        decoded(i+1) = 1;
        sign = sign*-1;
    end
    
    i = i+1;
end

disp(decoded);
