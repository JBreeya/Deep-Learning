#! /bin/bash
./run_clip_flax_tv.py \
    --output_dir $HOME/models/clip-rsicd \
    --model_name_or_path openai/clip-vit-base-patch32 \
    --dataset_name $HOME/CLIP-rsicd/rsicd.py \
    --data_dir /home/shared/data/RSICD_images \
    --train_file /home/shared/data/train_rsicd.jsonl \
    --validation_file /home/shared/data/valid_rsicd.jsonl \
    --text_column_name captions \
    --do_train --do_eval \
    --per_device_train_batch_size="128" \
    --per_device_eval_batch_size="128" \
    --preprocessing_num_workers="16" \
    --learning_rate="3e-4" \
    --adafactor \
    --warmup_steps="20" \
    --adam_beta1="0.9" \
    --adam_beta2="0.98" \
    --weight_decay="0.01" \
    --overwrite_output_dir \
    --num_train_epochs 5 \
    --logging_steps="2" \
    --eval_steps="20" \
    --push_to_hub="False" \
    --dtype="bfloat16" \
    --skip_memory_metrics="True" \
    --save_steps="200" \
    --save_total_limit 2 \
    --gradient_accumulation_steps 1 \
    --report_to all \
    --run_name="testing-5-captions+img-augs" \
    --save_strategy epoch \
    --save_optimizer="False" \
    --captions_per_image 5 \
    --augment_images \
    # --resume_from_checkpoint $HOME/gpt-neo-125M-code-clippy/ckpt_201 \
    # --max_train_samples 10240 \
    # --max_eval_samples="1000"
