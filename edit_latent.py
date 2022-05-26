import argparse
import math
import os
import numpy as np
import torch
from torch import optim
from torch.nn import functional as F
from torchvision import transforms
from PIL import Image
from tqdm import tqdm

import lpips
from model import Generator

def make_image(tensor):
    return (
        tensor.detach()
        .clamp_(min=-1, max=1)
        .add(1)
        .div_(2)
        .mul(255)
        .type(torch.uint8)
        .permute(0, 2, 3, 1)
        .to("cpu")
        .numpy()
    )
def change_latent_tensor(latent_code,indexes):
    new_tensor = latent_code.detach()
    for index in indexes : 
      new_tensor[index]+=0.5
    return new_tensor

def combine_latent_code(latent_code_1,latent_code_2):
  return torch.div(torch.add(latent_code_1,latent_code_2),2)

def generate_image(latent_code,noises,img_size,checkpoint):
    device="cuda"
    g_ema = Generator(img_size, 512, 8)
    g_ema.load_state_dict(torch.load(checkpoint)["g_ema"], strict=False)
    g_ema.eval()
    g_ema = g_ema.to(device)

    latent_temp = latent_code.detach().clone()

    img_gen,_ = g_ema([latent_temp.unsqueeze(0)], input_is_latent=True, noise=noises)
    
    img_ar = make_image(img_gen)
    #print(f'''path name is{os.path.splitext(os.path.basename("/content/stylegan2-pytorch/sample/test2.png"))[0]} ''')
    img_name = os.path.splitext(os.path.basename("/content/stylegan2-pytorch/sample/test2.png"))[0] + "-joe.png"
    pil_img = Image.fromarray(img_ar[0])
    pil_img.save(img_name)

if __name__ == "__main__":
  device = "cuda"
  parser = argparse.ArgumentParser(
      description="Image projector to the generator latent spaces"
  )
  parser.add_argument(
      "--latent", type=str, required=True, help="path to the model latent code"
  )
  parser.add_argument(
      "--latent2", type=str, required=False, help="path to the second latent code to be combines"
  )
  parser.add_argument(
        "--ckpt", type=str, required=True, help="path to the model checkpoint"
    )
  args = parser.parse_args()
  latent_file=torch.load(args.latent)
  file_name = "/content/stylegan2-pytorch/sample/test2.png" #Change Later
  img = latent_file[file_name]["img"]
  latent = latent_file[file_name]["latent"]
  noises = latent_file[file_name]["noise"]
  indexes_to_change = np.arange(0,len(latent),1)
  
  new_latent=""
  ## Second latent file to be combined 
  if(args.latent2):
    file_name_2="/content/stylegan2-pytorch/sample/test1.jpg"
    latent2=torch.load(args.latent2)[file_name_2]["latent"]
    new_latent=combine_latent_code(latent,latent2)
  else:
    indexes_to_change = np.arange(0,100,1)
    new_latent= change_latent_tensor(latent,indexes_to_change)
generate_image(new_latent,noises,256,args.ckpt)

  # print(latent.shape)
  # print(len(noise))
  # print(noise[0].shape)