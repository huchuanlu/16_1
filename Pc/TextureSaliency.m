function res_map = TextureSaliency(im, superpixel, spnum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[PC, or, ft, T] = phasecongmono(im);
[m,n,z] = size(im);
superpixel=double(superpixel+1);
region = regionprops(superpixel, 'pixelIdxList');

% sal = zeros(1:spnum);
res_map = zeros(m,n);
for i=1:spnum
    temp = struct2cell(region(i));
    temp = temp{:};
    sel_temp = PC(temp);
    res_map(temp) = sum(sel_temp)/length(sel_temp);
end
res_map = mat2gray(res_map);

end

