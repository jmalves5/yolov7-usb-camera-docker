YOLOv7 from USB Camera in Docker
======================
- Connect usb camera
- Install docker
- Install nvidia-docker2
- Run: 
```
    xhost +local:docker  # Use at your own risk, this allows X server access to Docker
    docker build -f yolo_from_usb_x86.Dockerfile -t yolo_from_usb . 
    docker run -it --ipc host --gpus all --network host --env DISPLAY=$DISPLAY --device /dev/video0 yolo_from_usb:latest
```



