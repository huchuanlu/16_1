function  matcaffe_init(use_gpu, model_def_file, model_file)
% matcaffe_init(model_def_file, model_file, use_gpu)
% Initilize matcaffe wrapper

if nargin < 1
  % By default use CPU
  use_gpu = 0;
end
if nargin < 2 || isempty(model_def_file)
  % By default use imagenet_deploy
  model_def_file = '../../models/bvlc_reference_caffenet/deploy.prototxt';
end
if nargin < 3 || isempty(model_file)
  % By default use caffe reference model
  model_file = '../../models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel';
end

caffe('init', model_def_file, model_file, 'test')
fprintf('Done with init\n');

% set to use GPU or CPU
if use_gpu
  fprintf('Using GPU Mode\n');
  caffe('set_mode_gpu');
  caffe('set_device',0);
else
  fprintf('Using CPU Mode\n');
  caffe('set_mode_cpu');
end
fprintf('Done with set_mode\n');
