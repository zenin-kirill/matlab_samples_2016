hold on;
%plot(normArr(:,1),normArr(:,6),'b'); 

xy = smooth(resultArray(:,17),10);
xz = smooth(resultArray(:,18),10);
yz = smooth(resultArray(:,19),10);
xyz = smooth(resultArray(:,20),10);
%xx = xx/norm(xx, inf);
%xx1 = xx1/norm(xx1, inf);
%plot3(normArr(:,2),normArr(:,3),normArr(:,4), 'b')
%plot3(normArr(:,2),normArr(:,3),normArr(:,7), 'g')
grid on;

plot(normArr(:,1),xy,'b'); 
plot(normArr(:,1),xyz,'r'); 
plot(normArr(:,1),xz,'c'); 
plot(normArr(:,1),yz,'m'); 
plot(normArr(:,1),normArr(:,7)* norm(normArr(:,7),2) - 20,'b'); 
plot(normArr(:,1),normArr(:,8)* norm(normArr(:,8),2) - 30,'m');  

plot(normArr(:,1),normArr(:,4)* norm(normArr(:,4),1.5) - 30,'g'); 

axis([500000 1000000 -30 30])

%set(gca,'YTick',[-30:5:30])
