function map = rfcn(im, prior_map)
    [m n k]=size(im);
    size_im=500;
    input_data = {prepare_image(im,prior_map,size_im)};

    % do forward pass to get scores
    % scores are now Width x Height x (Channels x 2) x Num
%     tic;
    scores = caffe('forward', input_data);
%     toc;
    temp=scores{1}(:,:,2);
    map=permute(temp,[2,1,3]); 
    map(map<0)=0;
    map=double(medfilt2(map,[8,8]));
    map=imresize(map,[m,n]);
    map=uint8(map*255);

%     imshow(map);
end


function images = prepare_image(im,guide,size_im)
IMAGE_DIM = size_im;

% resize to fixed input size
im = single(im);
guide=single(guide);

% mean BGR pixel
mean_pix = [103.939, 116.779, 123.68];

im = imresize(im, [IMAGE_DIM IMAGE_DIM]);
guide=imresize(guide,[IMAGE_DIM IMAGE_DIM]);
% RGB -> BGR
im = im(:, :, [3 2 1]);

% oversample (4 corners, center, and their x-axis flips)
images = zeros(IMAGE_DIM, IMAGE_DIM, 4, 1, 'single');
images(:,:,1:3,1)=permute(im,[2 1 3]);
images(:,:,4,1)=permute(guide,[2,1]);

    % mean BGR pixel subtraction
for c = 1:3
    images(:, :, c, :) = images(:, :, c, :) - mean_pix(c);
end

end
