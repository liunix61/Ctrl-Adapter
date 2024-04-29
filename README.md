# Ctrl-Adapter: An Efficient and Versatile Framework for Adapting Diverse Controls to Any Diffusion Model

Official implementation of **Ctrl-Adapter**, an efficient and versatile framework that adds diverse controls
to any image/video diffusion models by adapting pretrained ControlNets.


[![arXiv](https://img.shields.io/badge/ArXiv-2404.09967-orange)](https://arxiv.org/abs/2404.09967) 
[![projectpage](https://img.shields.io/badge/Project-Page-green)](https://ctrl-adapter.github.io/)
[![checkpoints](https://img.shields.io/badge/Model-Checkpoints-blue)](https://huggingface.co/hanlincs/ctrl-adapter)




[Han Lin](https://hl-hanlin.github.io/),
[Jaemin Cho](https://j-min.io),
[Abhay Zala](https://aszala.com/),
[Mohit Bansal](https://www.cs.unc.edu/~mbansal/)




<br>
<img width="800" src="assets/teaser_update.gif"/>
<br>


CTRL-Adapter is an efficient and versatile framework for adding diverse
spatial controls to any image or video diffusion model. It supports a variety of useful
applications, including video control, video control with multiple conditions, video control with
sparse frame conditions, image control, zero-shot transfer to unseen conditions, and video editing.



# 🔧 Setup

### Environment Setup

If you only need to perform inference with our code, please install from ```requirements_inference.txt```. To make our codebase easy to use, the primary libraries that need to be installed are Torch, Diffusers, and Transformers. Specific versions of these libraries are not required; the default versions should work fine :)

If you are planning to conduct training, please install from ```requirements_train.txt``` instead, which contains more dependent libraries needed.


```shell
conda create -n ctrl-adapter python==3.10
conda activate ctrl-adapter
pip install -r requirements_inference.txt # install from this if you only need to perform inference
pip install -r requirements_train.txt # install from this if you plan to do some training
```


# 🔮 Inference

We provde model checkpoints and inference scripts for Ctrl-Adapter trained on SDXL, I2VGen-XL, and SVD. We put some sample images/frames for inference under the folder ```assets/evaluation```. You can add your custom examples following the same file structure.

For model inference, we support two options:
- If you already have condition image/frames extracted from some image/video, you can use inference (w/ extracted condition). 
- If you haven't extracted control conditions and only have the raw image/frames, you can use inference (w/o extracted condition). In this way, our code can automatically extract the control conditions from the input image/frames and then generate corresponding image/video.

All inference scripts are put under ```/inference_scripts```.

## Controllable Image Generation 

<br>
<img width="800" src="assets/concatenated_image.jpg"/>
<br>



### SDXL

<table>
  <tr>
    <th>Control Conditions</th>
    <th colspan="1">Checkpoint</th>
    <th colspan="1">Inference (w/ extracted condition)</th>
    <th colspan="1">Inference (w/o extracted condition)</th>
  </tr>
  <tr>
    <td>Depth Map</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/sdxl_depth">HF link</a></td>
    <td>sdxl_inference_depth.sh</td>
    <td>sdxl_inference_extract_depth_from_raw_image.sh</td> 
  </tr>
  <tr>
    <td>Canny Edge</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/sdxl_canny">HF link</a></td>
    <td>sdxl_inference_canny.sh</td>
    <td>sdxl_inference_extract_canny_from_raw_images.sh</td>
  </tr>
</table>

Here is a sample command to run inference on SDXL with depth map as control (w/ extracted condition).

```
sh inference_scripts/sdxl/sdxl_inference_depth.sh
```


## Controllable Video Generation

<br>
<div>
    <img width="400" src="assets/girl_and_dog.gif" style="margin-right: 10px;"/>
    <img width="400" src="assets/newspaper_cat.gif"/>
</div>
<br>

### I2VGen-XL

<table>
  <tr>
    <th>Control Conditions</th>
    <th colspan="1">Checkpoint</th>
    <th colspan="1">Inference (w/ extracted condition)</th>
    <th colspan="1">Inference (w/o extracted condition)</th>
  </tr>
  <tr>
    <td>Depth Map</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_depth">HF link</a></td>
    <td>i2vgenxl_inference_depth.sh</td>
    <td>i2vgenxl_inference_extract_depth_from_raw_frames.sh</td> 
  </tr>
  <tr>
    <td>Canny Edge</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_canny">HF link</a></td>
    <td>i2vgenxl_inference_canny.sh</td>
    <td>i2vgenxl_inference_extract_canny_from_raw_frames.sh</td>
  </tr>
  <tr>
    <td>Soft Edge</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_softedge">HF link</a></td>
    <td>i2vgenxl_inference_softedge.sh</td>
    <td>i2vgenxl_inference_extract_softedge_from_raw_frames.sh</td>
  </tr>
</table>


### SVD

<table>
  <tr>
    <th>Control Conditions</th>
    <th colspan="1">Checkpoint</th>
    <th colspan="1">Inference (w/ extracted condition)</th>
    <th colspan="1">Inference (w/o extracted condition)</th>
  </tr>
  <tr>
    <td>Depth Map</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/svd_depth">HF link</a></td>
    <td>svd_inference_depth.sh</td>
    <td>svd_inference_extract_depth_from_raw_frames.sh</td> 
  </tr>
  <tr>
    <td>Canny Edge</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/svd_canny">HF link</a></td>
    <td>svd_inference_canny.sh</td>
    <td>svd_inference_extract_canny_from_raw_frames.sh</td>
  </tr>
  <tr>
    <td>Soft Edge</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/svd_softedge">HF link</a></td>
    <td>svd_inference_softedge.sh</td>
    <td>svd_inference_extract_softedge_from_raw_frames.sh</td>
  </tr>
</table>



## Video Generation with Multi-Condition Control

<br>
<img width="800" src="assets/boy_and_mom.gif"/>
<br>

We currently implemented multi-condition control on **I2VGen-XL**. The following checkpoint are trained on 7 control conditions, including depth, canny, normal, softedge, segmentation, lineart, and openpose. Here are the sample inference scripts that uses depth, canny, segmentation, and openpose as control conditions.

<table>
  <tr>
    <th colspan="1">Adapter Checkpoint</th>
    <th colspan="1">Router Checkpoint</th>
    <th colspan="1">Inference (w/ extracted condition)</th>
    <th colspan="1">Inference (w/o extracted condition)</th>
  </tr>
  <tr>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_multi_control_adapter">HF link</a></td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_multi_control_router">HF link</a></td>
    <td>i2vgenxl_inference_depth_canny_segmentation_openpose.sh</td>
    <td>i2vgenxl_inference_extract_depth_canny_segmentation_openpose_from_raw_frames.sh</td> 
  </tr>
</table>





## Video Generation with Sparse Control

<br>
<img width="400" src="assets/museum.gif"/>
<br>

Here we provide a sample inference script that uses user scribbles as condition, and 4 out of 16 frames for sparse control.

<table>
  <tr>
    <th>Control Conditions</th>
    <th colspan="1">Checkpoint</th>
    <th colspan="1">Inference (w/ extracted condition)</th>
  </tr>
  <tr>
    <td>User Scribbles</td>
    <td><a href="https://huggingface.co/hanlincs/Ctrl-Adapter/tree/main/i2vgenxl_scribble_sparse">HF link</a></td>
    <td>i2vgenxl_inference_scribble_sparse.sh</td>
  </tr>
</table>




# 📝 TODO List
- [x] Release environment setup, inference code, and model checkpoints.
- [ ] Release training code. (doing some final check, will come tmr!)
- [ ] Training guideline to adapt our Ctrl-Adapter to new image/video diffusion models. 
- [ ] Release evaluation code.

💗 Please let us know in the issues or PRs if you're interested in any relevant backbones or down-stream tasks that can be implemented by our Ctrl-Adapter framework!

# 📚 BibTeX

🌟 If you find our project useful in your research or application development, citing our paper would be the best reward for us.

```
@misc{lin2024ctrladapter,
      title={Ctrl-Adapter: An Efficient and Versatile Framework for Adapting Diverse Controls to Any Diffusion Model}, 
      author={Han Lin and Jaemin Cho and Abhay Zala and Mohit Bansal},
      year={2024},
      eprint={2404.09967},
      archivePrefix={arXiv},
      primaryClass={cs.CV}
}
```

# 🙏 Acknowledgements
The development of Ctrl-Adapter has been greatly inspired by the following amazing works and teams:

- [ControlNet](https://huggingface.co/lllyasviel/ControlNet)
- [SDXL](https://stability.ai/stable-diffusion)
- [I2VGen-XL](https://i2vgen-xl.github.io/)
- [Hotshot-XL](https://github.com/hotshotco/Hotshot-XL)
- [Stable Video Diffusion](https://github.com/Stability-AI/generative-models)

We hope that releasing this model/codebase helps the community to continue pushing these creative tools forward in an open and responsible way.
