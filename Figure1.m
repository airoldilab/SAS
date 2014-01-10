clear all
close all
clc

G1 = [1 0; 0 1];
G2 = [0 1; 1 0];
G3 = 0.5;

G1 = imresize(G1,50,'nearest');
G2 = imresize(G2,50,'nearest');
G3 = imresize(G3,100,'nearest');

Fig = figure(1);
G1(:,1) = 0;
G1(1,:) = 0;
G1(:,end) = 0;
G1(end,:) = 0;
imshow(G1);

text(22,25,'0','color',[0 0 0], 'fontsize',20);
text(72,25,'1','color',[0.99 0.99 0.99],'backgroundcolor','k', 'fontsize',20);
text(22,75,'1','color',[0.99 0.99 0.99],'backgroundcolor','k', 'fontsize',20);
text(72,75,'0','color',[0 0 0], 'fontsize',20);

Fig_prop = get(gcf);
boundbox = Fig_prop.PaperPosition;
width    = boundbox(3);
height   = boundbox(4);
set(gcf, 'PaperPosition', [0, 0, width, height]);
set(gcf, 'PaperSize', [width height]);
% saveas(Fig, 'twin_eg_w.eps','epsc');


Fig = figure(2);
G2(:,1) = 0;
G2(1,:) = 0;
G2(:,end) = 0;
G2(end,:) = 0;

imshow(G2);
text(22,25,'1','color',[0.99 0.99 0.99],'backgroundcolor','k', 'fontsize',20);
text(72,25,'0','color',[0 0 0], 'fontsize',20);
text(22,75,'0','color',[0 0 0], 'fontsize',20);
text(72,75,'1','color',[0.99 0.99 0.99],'backgroundcolor','k', 'fontsize',20);

Fig_prop = get(gcf);
boundbox = Fig_prop.PaperPosition;
width    = boundbox(3);
height   = boundbox(4);
set(gcf, 'PaperPosition', [0, 0, width, height]);
set(gcf, 'PaperSize', [width height]);
% saveas(Fig, 'twin_eg_w1.eps','epsc');


