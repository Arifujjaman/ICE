clear;


Ac=1,Am=1,Fc=5,Fm=4,T=5;
t = 0:0.01:T;

Ym=Am.*sin(2*pi*Fm*t);
subplot(411);
plot(t,Ym);
title('Message signal');

Yc=Ac.*sin(2*pi*Fc*t);
subplot(412);
plot(t,Yc);
title('carrier signal');

Z=Ac.*sin(2*pi*Fc*t+((Am/Ac).*(2*pi*Fm*t)));
subplot(413);
plot(t,Z,'r');
title('modulated signal FM');

Z=(Ac+Ym).*Yc;
subplot(414);
plot(t,Z,'r');
title('modulated signal AM');