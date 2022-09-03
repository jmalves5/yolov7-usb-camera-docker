# Python Base Image from https://hub.docker.com/r/arm32v7/python/
FROM arm32v7/alpine:latest
RUN apt-get update && apt-get install -yq build-essential dumb-init

# Copy the Python Script to run yolo from usb camera
COPY yolo_from_usb_cam.py ./
COPY requirements.txt.py ./
RUN curl https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/yolo.h5

# Intall the rpi.gpio python module
RUN pip install -r requirements.txt

# Trigger Python script
CMD ["python", "./yolo_from_usb_cam.py"]