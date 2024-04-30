python inference.py \
--model_name "svd" \
--control_types "canny" \
--huggingface_checkpoint_folder "svd_canny" \
--eval_input_type "frames" \
--evaluation_input_folder "assets/evaluation/frames" \
--skip_conv_in True \
--n_sample_frames 14 \
--num_inference_steps 25 \
--control_guidance_end 0.8 \
--height 512 \
--width 512
