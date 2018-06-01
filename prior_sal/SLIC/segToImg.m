function img = segToImg(seg, clustter)
%seg: the segment returned from segment
    seg_num = max(seg(:));
    centers = get_centers(seg);
    img1 = zeros(size(seg));
    img2 = zeros(size(seg));
    img3 = zeros(size(seg));
    
    if (nargin == 1)
        colors = rand(seg_num, 3);
        
        
        for i=1:seg_num
            inds = (seg==i);
            img1(inds) = colors(i, 1);
            img2(inds) = colors(i, 2);
            img3(inds) = colors(i, 3);
        end
    else
        for m = 1:length(clustter)
            ele = clustter{m};
            color = rand(3,1);
            factor = linspace(1, 1, length(ele));
            for i = 1:length(ele)
                inds = seg==ele(i);
                img1(inds) = color(1)*factor(i);
                img2(inds) = color(2)*factor(i);
                img3(inds) = color(3)*factor(i);
            end
        end
    end
    img(:,:,1) = img1;
    img(:,:,2) = img2;
    img(:,:,3) = img3;
    
    figure;imshow(img);
    hold on
    for i=1:seg_num
        plot(centers(i, 2), centers(i, 1), '.');
        text(centers(i, 2), centers(i, 1), num2str(i));
    end
    hold off
end