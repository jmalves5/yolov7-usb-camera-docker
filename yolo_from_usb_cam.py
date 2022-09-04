from detect_callable import detect
import cv2
import torch

with torch.no_grad():
    result = detect(weights='yolov7.pt', conf_thres=0.60, imgsz=640, source="0", view_img=True)