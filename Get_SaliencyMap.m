function res_sal = Get_SaliencyMap(im, map)
    sigma_s=10;  %10,50
    sigma_r=0.3;
    num_iterations=5;
    res_sal=Saliency_map(im,map);
    [PC, or,ft] = phasecongmono(im);
    res_sal = RF(res_sal, sigma_s, sigma_r, num_iterations, PC);
    res_sal(res_sal<0)=0;
    res_sal = mat2gray(res_sal);
    res_sal=uint8(res_sal * 255);
end
