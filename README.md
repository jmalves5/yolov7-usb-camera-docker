README
- Connect usb camera
- Install docker
- Install nvidia-docker2
- Run: 
```
    xhost +local:docker
    docker build -f yolo_from_usb_x86.Dockerfile -t yolo_from_usb . 
    docker run -it --ipc=host --gpus all --runtime=nvidia --network=host --env DISPLAY=$DISPLAY  --privileged --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v /tmp/. X11-unix:/tmp/.X11-unix --device /dev/video0 yolo_from_usb:latest
```



