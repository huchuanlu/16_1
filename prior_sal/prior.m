function mapbig = prior(img)

%% 1. simplest possible usage : compute standard Itti-Koch Algorithm:
addpath './MEX'
addpath './SLIC'

delta = 0.25;
k=6;
numberofsp=200;

%% step 1, oversegmentation
[sp, maxsp]  = slicmex(img, numberofsp, 20);
sp = double(sp);
trya=sp+1;

% the mean color of the sp
meanLabColor=zeros(maxsp,1,3) ;
LabImg=RGB2Lab(img);
for channel = 1: 3
    tempImg = LabImg(:,:,channel);
    for i=1:maxsp
        meanLabColor(i,1,channel)=mean( tempImg(trya==i));
    end
end


%% step 2, element uniqueness
tic
[X, Y] = size(sp) ;
cntr=get_centers(sp+1);
cntr = cntr / max( X , Y);
U=uniqueness( cntr, meanLabColor, delta );
U=(U-min(U(:)))/(max(U(:))-min(U(:)));
tryb = sp+1;
for i=1:maxsp
    tryb(sp==(i-1))=U(i);
end

param = default_pami_param;
map1 = simpsal(img, param);
mapbig1 = mat2gray(imresize( map1 , [ size(img,1) size(img,2) ] ));
mapbig = mapbig1+tryb;

%% step 3, apply global center bias
if ( param.centerbias )
  h = size(mapbig,1);
  w = size(mapbig,2);
  mapbig = mapbig .* (gausswin(h,1) * gausswin(w,1)');
end

mapbig = uint8(mapbig*255);
end
