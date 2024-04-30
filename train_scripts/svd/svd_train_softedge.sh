accelerate launch train.py \
--yaml_file configs/svd_train_softedge.yaml \
--evaluation_input_folder "assets/evaluation/frames" \
--evaluation_prompt_file "captions.json" \
--num_inference_steps 25 \
--control_guidance_end 0.6 \
--save_n_steps 2000 \
--validate_every_steps 2000 \
--save_starting_step 2000
