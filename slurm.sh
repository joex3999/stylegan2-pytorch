#!/bin/bash
#SBATCH --job-name="stylegan_cityscapes_faragy"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=32G
#SBATCH --gpus=a40:1
#SBATCH --time=15:00:00
#SBATCH --mail-type=ALL
##SBATCH --partition=DEADLINE
##SBATCH --comment=ECCVRebuttal
#SBATCH --output=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_output.out
#SBATCH --error=/usr/stud/faragy/storage/slurm/slurmDebug/slurm_temp_error.out

 python train.py  "/usr/stud/faragy/storage/user/main/faragy/data" --iter 1000
