#!/bin/bash
#SBATCH --job-name="stylegan_cityscapes_faragy"
#SBATCH --nodes=2
#SBATCH --cpus-per-task=2
#SBATCH --mem=32G
#SBATCH --gpus=a40:1
#SBATCH --time=15:00:00
#SBATCH --mail-type=ALL
##SBATCH --partition=DEADLINE
##SBATCH --comment=ECCVRebuttal
#SBATCH --output=./slurmDebug/slurm-%j.out
#SBATCH --error=./slurmDebug/slurm-%j.out


python train.py  "/content/stylegan2/data/" --iter 1000
#python main_test.py
