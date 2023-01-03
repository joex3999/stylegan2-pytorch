#!/bin/bash
#SBATCH --job-name="train-faragy"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=32G
#SBATCH --gpus=a40:1
#SBATCH --time=40:00:00
#SBATCH --mail-type=ALL
##SBATCH --partition=DEADLINE
##SBATCH --comment=ECCVRebuttal
#SBATCH --output=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_%j_output.out
#SBATCH --error=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_%j_error.out

python calculate_all_fids.py --inception "/usr/stud/faragy/storage/user/main/faragy/data/inception/inception_lmdb_cityscapes_25k.pkl" --fid_json_file "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/fids/fids_25k_16B.json" --ckpt_folder "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/checkpoint/fourth_temp_2"
#python prepare_data.py --size=256 --out "/usr/stud/faragy/storage/user/main/faragy/data/lmdb_cityscapes_25k" "/storage/group/dataset_mirrors/01_incoming/cityscapes/leftImg8bit" "~/storage/local/faragy/data/cityscapes/leftImg8bit"
#python train.py  "/usr/stud/faragy/storage/user/main/faragy/data/lmdb_cityscapes_25k" --batch 16 --suffix "_16"
#python train.py  "/usr/stud/faragy/storage/user/main/faragy/data/lmdb_cityscapes_25k" --batch 16 --suffix "_16" --ckpt "checkpoint/170000.pt" --inception "/usr/stud/faragy/storage/user/main/faragy/data/inception/inception_lmdb_cityscapes_25k.pkl" --fid_json_file "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/fids/fids_25k_16B.json"
#python calc_inception.py --size 256 --batch 16 "/usr/stud/faragy/storage/user/main/faragy/data/lmdb_cityscapes_25k" 
#python fid.py  --inception  "/usr/stud/faragy/storage/user/main/faragy/data/inception/inception_lmdb_cityscapes_25k.pkl" --fid_json_file "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/fids.json" "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/checkpoint/060000.pt" 
