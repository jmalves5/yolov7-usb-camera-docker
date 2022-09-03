# Python Base Image
FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
ENV DEBIAN_FRONTEND=noninteractive

ENV PATH="${PATH}:/opt/hpcx/ompi/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/hpcx/ompi/lib"

RUN apt-get update && apt-get install -yq build-essential dumb-init pkg-config curl python3-pip python3-opencv wget git zip htop screen libgl1-mesa-glx libboost-all-dev libgtk2.0-dev

RUN pip install seaborn thop opencv-python pandas matplotlib

RUN git clone https://github.com/jmalves5/yolov7.git

RUN wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt -O ./yolov7/yolov7.pt

COPY requirements.txt ./

RUN pip install -r requirements.txt
RUN pip install "opencv-python<4.3"

# Copy the Python Script to run yolo from usb camera
COPY yolo_from_usb_cam.py ./yolov7


WORKDIR yolov7

# Trigger Python script
CMD ["python", "./yolo_from_usb_cam.py"]