function centers = get_centers(seg)
    seg_num = max(seg(:));
    centers = zeros(seg_num, 2);
    
    for i=1:seg_num
        [rInd, cInd] = find(seg==i);
        centers(i, :) = [(mean(rInd)),( mean(cInd))];
    end
end