function res_map = Saliency_map(im,map)
%This function get the final saliency map


thresh=mean(map(:));
bi_map=(map>thresh);    %Segment map to a binary map
forpixind=find(bi_map==1); %foreground pixels

%If there is no foreground, return res_map directly
if length(find(bi_map==1))==0
    res_map=im2double(map);
else
    image_rgb = double(im);
    image_lab = rgb2lab(image_rgb);
    [m n k] = size(image_rgb);
    yim = 1-repmat(((0:m-1)/(m-1))', 1, n);
    xim = repmat(((0:n-1)/(n-1)), m, 1);
  
    Lab_bins = [5 20 20];
    
    L = image_lab(:,:,1);
    a = image_lab(:,:,2);
    b = image_lab(:,:,3);
    
% color histogram
    ll = min(floor(L/(100/Lab_bins(1))) + 1, Lab_bins(1));
    aa = min(floor((a+120)/(240/Lab_bins(2))) + 1, Lab_bins(2));
    bb = min(floor((b+120)/(240/Lab_bins(3))) + 1, Lab_bins(3));
    Q = (ll-1) * Lab_bins(2) * Lab_bins(3) + ...
        (aa-1) * Lab_bins(3) + ...
        bb + 1;


    delta = 5;
    alpha = 2;
    diff_color = unique(Q);  %Different colors in im
    num = length(diff_color);
    map_temp = zeros(m,n,num);
    
    for i=1:num
        sc = zeros(m,n);
        conf_map = zeros(m,n);
        bool_map = (Q == diff_color(i));
        overnum = sum(sum(bool_map & bi_map));
        binum = sum(bool_map(:));
        conf = overnum/binum;  %accuracy score conf, the equation (13) in our paper
        pixind=find(bool_map==1);
        
        %%%%If this bool map has overlap area with bi_map,we do the foreground growth stage
        if conf~=0
            inter=intersect(pixind,forpixind);
            conf_map(inter)=1;
            ran=randi(length(inter)); %For simplicity, we just sample a random point as the center of foreground
            bestpix=inter(ran);
            outpix=setdiff(pixind,inter);
            conf_map(outpix)=conf;
            sc(inter)=1;                % spatial confidence, equation (12) 
            for l=1:length(outpix)
                xvals1 = xim(outpix(l));
                yvals1 = yim(outpix(l));
                loc=[xvals1,yvals1];
                xvals2 = xim(bestpix);
                yvals2 = yim(bestpix);
                loc_center = [xvals2,yvals2];
                sc(outpix(l)) = exp(-norm(loc-loc_center)/delta);
            end
                mymap = double(bool_map);
                thismap = conf_map.*sc.*mymap;
        else
            thismap = conf*bool_map;
        end
        map_temp(:,:,i) = thismap;
    end

    res_map = sum(map_temp,3)+alpha*im2double(map);
    % res_map = sum(map_temp,3);
end