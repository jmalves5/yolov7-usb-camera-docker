# Pytorch Base Image
FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq build-essential dumb-init pkg-config curl python3-pip python3-opencv wget git zip htop screen libgl1-mesa-glx libboost-all-dev libgtk2.0-dev

RUN pip install torch-tensorrt -f https://github.com/pytorch/TensorRT/releases
RUN pip install seaborn thop "opencv-python<4.3" pandas matplotlib

RUN git clone https://github.com/jmalves5/yolov7.git

RUN wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt -O ./yolov7/yolov7.pt

# Copy the Python Script to run yolo
COPY yolo_from_usb_cam.py ./yolov7
COPY usb_camera_test.py ./yolov7

WORKDIR yolov7

# Trigger Python script
CMD ["python", "./yolo_from_usb_cam.py"]
#CMD ["python", "./usb_camera_test.py"]
