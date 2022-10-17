close all
clear
clc
M=2e5;  %Numero de repeticiones
x=zeros(1,M+1);
y=zeros(1,M+1);
z=zeros(1,M+1);
u=zeros(1,M+1);
v=zeros(1,M+1);
w=zeros(1,M+1);
a=0.35;  %Valor de a
F=1;  %Factor de escalamiento
K1=7;    %x=u*K1
K2=2;    %y=v*K2
K3=15;    %z=w*K3
x(1,1)=1;
y(1,1)=1;
z(1,1)=1;
u(1,1)=1;
v(1,1)=1;
w(1,1)=1;
h=1e-3;  %Paso de integracion
for i=1:M
    x(1,i+1)= x(1,i) + h*( F*( y(1,i)*z(1,i) + x(1,i)*(y(1,i) - a) ) );
    y(1,i+1)= y(1,i) + h*( F*( 1 - abs(x(1,i)) ) );
    z(1,i+1)= z(1,i) + h*( F*( -x(1,i)*y(1,i) - z(1,i) ) );
end
figure
plot3(x,y,z,'r')
grid on
xlabel('x');ylabel('y');zlabel('z');
title('Factor de Escalamiento')
for i=1:M
    u(1,i+1)= u(1,i) + h*( F*( (K2*K3/K1)*v(1,i)*w(1,i) + u(1,i)*( K2*v(1,i) - a ) ) );
    v(1,i+1)= v(1,i) + h*( F*( (1/K2) - (K1/K2)*abs(u(1,i)) ) );
    w(1,i+1)= w(1,i) + h*( F*( -(K2*K1/K3)*u(1,i)*v(1,i) - w(1,i) ) );
end
figure
plot3(u,v,w,'r')
grid on
xlabel('x');ylabel('y');zlabel('z');
title('Cambio de Variable')