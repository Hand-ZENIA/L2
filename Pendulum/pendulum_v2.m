% Planar pendulum
% H. ZENIA
%   23/11/2019
g=10;                % gravitational force constant
l=1;                 % length of the pendulum
m=1;                 % mass
Nt=10000;             % number of time steps
NE=20;
Emin=-m*g*l;
Emax=1.5*m*g*l;
dE=(Emax-Emin)/(NE-1); % energy increment
E=zeros(1,NE);       % energies 
for ie=1:NE
  E(ie)=Emin+(ie-1)*dE;
  t=zeros(1,Nt);       % time
  x=zeros(1,Nt);       % position
  v=zeros(1,Nt);       % velocity
  t_i=0;               % initial time
  t_f=6;              % final time
  e=(t_f-t_i)/(Nt-1);  % small time interval
  t(1)=t_i;            % initial time
  x(1)=0;              % initial position
  v(1)=sqrt(2*(E(ie)+m*g*l)/m);    % initial velocity
  a1=-(g/l)*sin(x(1));
  for i=2:Nt
    x(i)=x(i-1)+v(i-1)*e+a1*e*e/2;
    a2=-(g/l)*sin(x(i));
    v(i)=v(i-1)+(a1+a2)*e/2;
    a1=a2;
  end  %i
  %  plot(t,x)
  plot(x,v)
  hold on
end %ie
