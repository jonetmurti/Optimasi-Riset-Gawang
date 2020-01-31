/*
 *  Author :
 *  Aditya Putra Santosa
 *  13517013
 */
#ifndef FIELD_DETECTOR
#define FIELD_DETECTOR

#include "ros/ros.h"
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/opencv.hpp"
#include "daho_vision/FieldConfig.h"
// #include "../src/minIni/minIni.h"
/////////////////////
#include <vector>

using namespace std;
using namespace cv;

// #define INVALID_VALUE -1024
#define v2f vector<Vec2f>
#define v6f vector<Vec6f>
#define v3f vector<Vec3f>
#define v4i vector<Vec4i>
#define v4f vector<Vec4f>
#define v2i vector<Vec2i>

namespace Robot
{
class FieldDetector
{
private:
    vector<vector<Point>> fieldBoundary;
    Mat fieldMask, fieldReal;
    int minH, minS, minV;
    int maxH, maxS, maxV;
    int fieldPartition;

public:
    FieldDetector();
    // void init(minIni *ini);
    vector<vector<Point>> getBoundary() { return fieldBoundary; }
    void Process(Mat m, bool getBoundary=false);
    Mat getFieldReal() { return fieldReal; }
    Mat getFieldMask() { return fieldMask;}
    void paramCallback(daho_vision::FieldConfig &config, uint32_t level);
    // void LoadINI(minIni *ini);
    // void SaveINI(minIni *ini);
};
} // namespace Robot

#endif