from detect import detect
import cv2
import torch

with torch.no_grad():
    result = detect(weights='yolov7.pt', conf_thres=0.60, imgsz=320, source="0")