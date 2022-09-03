from imageai.Detection import ObjectDetection
import cv2

import tensorflow as tf

gpu_devices = tf.config.experimental.list_physical_devices('GPU')
for device in gpu_devices:
    tf.config.experimental.set_memory_growth(device, True)

# Creating an Object of the Object Detection Class
obj_detect = ObjectDetection()


# Set and Load the YOLO Mode
obj_detect.setModelTypeAsYOLOv3()
obj_detect.setModelPath("yolo.h5")
obj_detect.loadModel()

# Create camera feed
cam = cv2.VideoCapture(0) #0=front-cam, 1=back-cam
cam.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cam.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

while True:    ## read frames
    ret, img = cam.read()    ## predict yolo
    img, preds = obj_detect.detectObjectsFromImage(input_type="array", input_image=img, minimum_percentage_probability=40, output_type="array")
    cv2.imshow("", img)    ## press q or Esc to quit    
    if (cv2.waitKey(1) & 0xFF == ord("q")) or (cv2.waitKey(1)==27):
        break## close camera
cam.release()
cv2.destroyAllWindows()