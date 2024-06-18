cd dsgn/utils/rotate_iou && g++ -o calculate_iou.so -shared -fPIC calculate_iou.cpp 
cd /home/DSGN_DockerizeAndDeploy
python3 setup.py build develop --user