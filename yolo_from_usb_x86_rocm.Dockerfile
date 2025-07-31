# Pytorch Base Image
FROM rocm/pytorch:rocm5.7_ubuntu20.04_py3.9_pytorch_1.12.1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq build-essential dumb-init pkg-config curl python3-pip python3-opencv wget git zip htop screen libgl1-mesa-glx libboost-all-dev libgtk2.0-dev

# RUN pip install torch-tensorrt -f https://github.com/pytorch/TensorRT/releases
# RUN pip install seaborn thop "opencv-python<4.3" pandas matplotlib scipy

RUN git clone https://github.com/jmalves5/yolov7.git

RUN wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt -O ./yolov7/yolov7.pt

# Copy the Python Script to run yolo
COPY yolo_from_usb_cam.py ./yolov7
COPY usb_camera_test.py ./yolov7

WORKDIR yolov7

#RUN pip install -r requirements.txt
RUN pip install numpy==1.26.4 pandas opencv-python seaborn thop matplotlib scipy

# Trigger Python script
CMD ["python", "./yolo_from_usb_cam.py"]
#CMD ["python", "./usb_camera_test.py"]
