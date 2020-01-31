/*
 *  Author :
 *  Aditya Putra Santosa
 *  13517013
 */

#include "daho_vision/FieldDetector.h"

using namespace std;
using namespace cv;
using namespace Robot;

// #define DEBUG_FIELD

#ifdef DEBUG_FIELD
#define printExpr(EXPR) cout << #EXPR << " : " << EXPR << endl;
#define printExprC(S, EXPR) cout << S << " : " << EXPR << endl;
#define printStr(S) cout << S << endl;
#else
#define printExpr(EXPR)
#define printStr(S)
#endif

FieldDetector::FieldDetector()
{
    minH = 0;
    minS = 0;
    minV = 0;
    maxH = 255;
    maxS = 255;
    maxV = 255;
    fieldPartition = 1;
    // namedWindow("Field Mask", WINDOW_AUTOSIZE);
    namedWindow("Field Real", WINDOW_AUTOSIZE);
}

// void FieldDetector::init(minIni *ini)
// {
//     //Load setting
//     LoadINI(ini);
//     //Create window
//     namedWindow("Field Real", CV_WINDOW_NORMAL);
//     namedWindow("Field Mask", CV_WINDOW_NORMAL);
//     namedWindow("Field Parameter", CV_WINDOW_NORMAL);
//     //Create trackbar
//     createTrackbar("minH", "Field Parameter", &minH, 255);
//     createTrackbar("minS", "Field Parameter", &minS, 255);
//     createTrackbar("minV", "Field Parameter", &minV, 255);
//     createTrackbar("maxH", "Field Parameter", &maxH, 255);
//     createTrackbar("maxS", "Field Parameter", &maxS, 255);
//     createTrackbar("maxV", "Field Parameter", &maxV, 255);
//     createTrackbar("fieldPartition", "Field Parameter", &fieldPartition, 5);
// }

void FieldDetector::Process(Mat m, bool getBoundary)
{
    m.copyTo(fieldMask);
    GaussianBlur(fieldMask, fieldMask, Size(3, 3), 0);
    cvtColor(fieldMask, fieldMask, COLOR_BGR2HSV);
    GaussianBlur(fieldMask, fieldMask, Size(5, 5), 0);
    inRange(fieldMask, Scalar(minH, minS, minV), Scalar(maxH, maxS, maxV), fieldMask);
    fieldReal.setTo(Scalar(0));
    m.copyTo(fieldReal, fieldMask);
    cvtColor(fieldMask, fieldMask, COLOR_GRAY2BGR);
    imshow("Field Mask", fieldMask);
    imshow("Field Real", fieldReal);
    waitKey(1);
}

void FieldDetector::paramCallback(daho_vision::FieldConfig &config, uint32_t level)
{
    minH = config.minH;
    minS = config.minS;
    minV = config.minV;
    maxH = config.maxH;
    maxS = config.maxS;
    maxV = config.maxV;
}

// void FieldDetector::LoadINI(minIni *ini)
// {
//     int value = 0;
//     if ((value = ini->geti("Field Detector", "minH", INVALID_VALUE)) != INVALID_VALUE)
//         minH = value;
//     if ((value = ini->geti("Field Detector", "minS", INVALID_VALUE)) != INVALID_VALUE)
//         minS = value;
//     if ((value = ini->geti("Field Detector", "minV", INVALID_VALUE)) != INVALID_VALUE)
//         minV = value;
//     if ((value = ini->geti("Field Detector", "maxH", INVALID_VALUE)) != INVALID_VALUE)
//         maxH = value;
//     if ((value = ini->geti("Field Detector", "maxS", INVALID_VALUE)) != INVALID_VALUE)
//         maxS = value;
//     if ((value = ini->geti("Field Detector", "maxV", INVALID_VALUE)) != INVALID_VALUE)
//         maxV = value;
//     if ((value = ini->geti("Field Detector", "fieldPartition", INVALID_VALUE)) != INVALID_VALUE)
//         fieldPartition = value;
// }

// void FieldDetector::SaveINI(minIni *ini)
// {
//     ini->put("Field Detector", "minH", minH);
//     ini->put("Field Detector", "minS", minS);
//     ini->put("Field Detector", "minV", minV);
//     ini->put("Field Detector", "maxH", maxH);
//     ini->put("Field Detector", "maxS", maxS);
//     ini->put("Field Detector", "maxV", maxV);
//     ini->put("Field Detector", "fieldPartition", fieldPartition);
// }