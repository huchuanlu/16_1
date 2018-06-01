## Saliency Detection with Recurrent Fully Convolutional Networks

### Introduction

RFCN is a state-of-the-art salient object detection system. This system incorporate saliency prior knowledge to a recurrent deep network for more accurate inference.

### Citing RFCN

If you find RFCN useful in your research, please consider to cite our paper:

     @inproceedings{ ,
        title={Saliency Detection with Recurrent Fully Convolutional Networks},
        author={Wang, Linzhao and Wang, Lijun and Lu, Huchuan and Zhang, Pingping and Ruan, Xiang},
        booktitle={European Conference on Computer Vision},
        year={2016}
     }

### Dependencies

* Deep learning framework Caffe [R1] and its dependencies. We utilize the version of caffe based on [R2] .
* Prior map reproduction based on [R3].
* Post-processing based on [R4] and [R5]
* Cuda enabled GPUs.

### How to Run

* First make sure that all the software dependencies have been installed following their guidelines. 
* Download the trained model and put it to somewhere.
* Then run demo in Matlab to generate saliency maps.
* The current implementation has been tested on MATLAB R2014b on a Linux 64-bit machine with a TITAN-X GPU.

### Contact

If any problems, feel free to contact linzertling@mail.dlut.edu.cn

### Reference

[R1] Jia Y, Shelhamer E, Donahue J, et al. Caffe: Convolutional architecture for fast feature embedding, ACM International Conference on Multimedia, 2014.

[R2] Long, J., Shelhamer, E., Darrell, T.: Fully convolutional networks for semantic segmentation, CVPR 2015.

[R3] Itti, L., Koch, C., Niebur, E.: A model of saliency-based visual attention for rapid scene analysis, PAMI 1998.

[R4] Eduardo S. L. Gastal  and  Manuel M. Oliveira: Domain Transform for Edge-Aware Image and Video Processing, ACM Transactions on Graphics, 2011.

[R5] Peter Kovesi: Image Features From Phase Congruency, Videre: A
Journal of Computer Vision Research, 1999.

###Models to Download

* BaiDuYun: http://pan.baidu.com/s/1sleTkUp
* OneDrive: https://1drv.ms/f/s!AkcckZXezzIRbTXlDp2okX6nTSE