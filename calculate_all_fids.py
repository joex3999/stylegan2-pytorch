import argparse
import os
import numpy as np
from tqdm import tqdm
import json
from pathlib import Path
import subprocess
def get_all_fids(inception_file,ckpt_folder,fid_json_file):
    try:
        loc=Path(ckpt_folder)
        if loc.exists():
            print("Found location and Executing Checkpoints")
        else:
            print("Location does not exist, please specify a valid location for checkpoints")
            return
        for _, _, files in os.walk(ckpt_folder):
            for file in files :
                print(f"Calculating FID for checkpoint {file}")
                ckpt = Path(ckpt_folder+"/"+file)
                command = f"python fid.py  --inception {inception_file} --fid_json_file {fid_json_file} {ckpt}"
                s = subprocess.getstatusoutput(command)
                print(s)
    except Exception as e :
        print(f"Exception occures:\n {e}")


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Calculate FID scores")
    parser.add_argument(
        "--inception",
        type=str,
        default=None,
        required=True,
        help="path to precomputed inception embedding",
    )
    parser.add_argument(
        "--ckpt_folder",
        type=str,
        required=True,
        help="path to ckpt folder",
    )
    parser.add_argument(
        "--fid_json_file",
        type=str,
        required=True,
        help="path to saved fid json file",
    )
    args = parser.parse_args()
    print("Executing get_all_fids")
    get_all_fids(args.inception,args.ckpt_folder,args.fid_json_file)
