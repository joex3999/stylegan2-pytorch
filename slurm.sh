#!/bin/bash
#SBATCH --job-name="stylegan_cityscapes_faragy"
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

#python train.py  "/usr/stud/faragy/storage/user/main/faragy/data/lmdb" --batch 32 --suffix "_32"
#python calc_inception.py --size 256 --batch 16 "/usr/stud/faragy/storage/user/main/faragy/data/lmdb" 
#python fid.py  --inception  "/usr/stud/faragy/storage/user/main/faragy/data/inception/inception_lmdb.pkl" --fid_json_file "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/fids.json" "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/checkpoint/060000.pt" 
python calculate_all_fids.py --inception "/usr/stud/faragy/storage/user/main/faragy/data/inception/inception_lmdb.pkl" --fid_json_file "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/fids_32.json" --ckpt_folder "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/checkpoint/seconds_checkpoints_batch_32"