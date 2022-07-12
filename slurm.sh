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
#SBATCH --output=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_output.out
#SBATCH --error=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_error.out

python train.py --ckpt "/usr/stud/faragy/storage/user/main/faragy/stylegan2-pytorch/checkpoint/040000.pt" "/usr/stud/faragy/storage/user/main/faragy/data" 
