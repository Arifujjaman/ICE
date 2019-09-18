clc;
close all;
clear;

bitstream = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
L = length(bitstream);
n = 500;
dt = 1/n;

x = 0:dt:L;
y = zeros(1, length(x));

nonzero = 0;
i = 0;

while(i<L)
    disp(nonzero);
    cnt=0;
    j = i;
    while(j<L && j<i+4)
        if(bitstream(j+1)==0)
            cnt = cnt+1;
        else
            break;
        end
        j = j+1;
    end
    
    if(cnt==4)
        if(mod(nonzero, 2)==1)
            bitstream(i+4) = 2;
            nonzero = nonzero+1;
        else
            bitstream(i+1) = 3;
            bitstream(i+4) = 2;
            nonzero = nonzero+2;
        end
        i=i+3;
        
    else
        nonzero = nonzero+bitstream(i+1);
    end
    
   
    
    i = i+1;
end

sign = -1;

for i=0 : L-1
    if(bitstream(i+1)==2)
        y((i*n+1) : (i+1)*n) = sign;
    end
    
    if(bitstream(i+1)==1 || bitstream(i+1)==3)
        sign = sign*-1;
        y((i*n+1) : (i+1)*n) = sign;
    end
end

plot(x, y, 'r');
axis([0 x(end) -4 4]);
grid on;

xlabel('Time');
ylabel('Voltage');

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