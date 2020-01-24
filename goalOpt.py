import cv2 as cv
import numpy as np

def PreProcess(rawImage, field) : # Taken from existing goal post detection program
    field = cv.cvtColor(field, cv.COLOR_BGR2GRAY)
    #Image Processing
    #--------------------------------Color thresholding--------------------------------
    hasil = rawImage
    pp = cv.GaussianBlur(rawImage, (3, 3), 0)
    minB = 0
    minG = 0
    minR = 0
    maxB = 0
    maxG = 0
    maxR = 0
    pp = inRange(pp, (minB, minG, minR), (maxB, maxG, maxR));
    m.copyTo(pp, pp);
    # imshow("Pre-Processing", pp)
    #--------------------------------Adaptive thresolding--------------------------------
    pp = cv.cvtColor(pp, COLOR_BGR2GRAY)
    pp = cv. GaussianBlur(pp, (3, 3), 0)
    pp = cv.GaussianBlur(pp, (9, 9), 0)
    pp = cv.adaptiveThreshold(pp, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY, 5, 0)
    pp = cv.GaussianBlur(pp, (5, 5), 0)
    #--------------------------------Crop setengah atas--------------------------------
    Mat roi = pp(Rect(0, 0, 640, yCrop))
    roi.setTo(Scalar(0, 0, 0))
    #--------------------------------Gabor filter--------------------------------
    # Mat hasilGabor1, hasilGabor2
    gaborKernel1 = cv.getGaborKernel((3, 3), sigma, tetha / 360 * CV_2PI, lambd, gamma)
    hasilGabor1 = cv.filter2D(pp, cv.CV_8UC3, gaborKernel1)
    gaborKernel2 = cv.getGaborKernel((3, 3), sigma, (tetha + 180) / 360 * CV_2PI, lambd, gamma)
    hasilGabor2 = cv.filter2D(pp, cv.CV_8UC3, gaborKernel2)
    pp = cv.bitwise_or(hasilGabor1, hasilGabor2)
    field = cv.bitwise_not(field)
    pp = cv.bitwise_and(pp, field)
    field = cv.bitwise_not(field)
    m.copyTo(ppDebug, pp);
    # cout << "Ini Gambarnya" << endl;
    cv.imshow("Pre-Proc Final", ppDebug)
    # resize(gab, gab, Size(300, 300));
    # imshow("Gabor filter", gab);
    #--------------------------------Contour detection--------------------------------
    vector<vector<Point>> contours;
    findContours(pp, contours, RETR_TREE, CHAIN_APPROX_SIMPLE);

def DecisionMaking(goalPostImg) :

def Main() :

Main()