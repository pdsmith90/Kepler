function [E, runtime, iter] = Kepler(M, e, maxiter, acc)
Ek=M;
Ekp1=M+((e.*sin(M))./(1-e.*cos(M)));
iter=0;
tic
while abs(Ekp1-Ek)>=acc && iter<=maxiter
    Ek=Ekp1;
    f=Ek-e.*sin(Ek)-M;
    fp=1-e.*cos(Ek);
    Ekp1=Ek-(f./fp);
    iter=iter+1;
end
E=Ekp1;
runtime=toc;

end
