# Python Base Image
FROM tensorflow/tensorflow:2.7.2-gpu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq build-essential dumb-init curl python3-opencv wget
# RUN apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev
RUN /usr/bin/python3 -m pip install --upgrade pip

COPY requirements.txt ./

# Intall the rpi.gpio python module
RUN yes | pip install -r requirements.txt

RUN curl -LJO https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/yolo.h5

# Copy the Python Script to run yolo from usb camera
COPY yolo_from_usb_cam.py ./

# Trigger Python script
CMD ["python", "./yolo_from_usb_cam.py"]