addpath(genpath('./'));
im = imread('12003.jpg');
tic;
%step 1: prior map
prior_map = prior(im);

%step 2: init caffe network (spews logging info)
model_def_file='./models/fine-tune/deploy.prototxt';
model_file='./models/fine-tune/Refcn-8s_iter_100000.caffemodel';
use_gpu=1;
init(use_gpu,model_def_file, model_file);

%step 3: RFCN detection
map = rfcn(im, prior_map);


%step 4: post-processing
res_sal = Get_SaliencyMap(im,map);
toc;

imshow(res_sal);
