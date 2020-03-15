/*
/*  Author :
 *  Aditya Putra Santosa
 *  13517013
 */
#include <iostream>
#include <vector>
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/opencv.hpp"
#include "daho_vision/GoalFinder2019.h"

using namespace std;
using namespace cv;
using namespace Robot2019;

// #define DEBUG_GOALFINDER

#ifdef DEBUG_GOALFINDER
#define printExpr(EXPR) cout << #EXPR << " : " << EXPR << endl;
#define printExprC(S, EXPR) cout << S << " : " << EXPR << endl;
#define printStr(S) cout << S << endl;
#else
#define printExpr(EXPR)
#define printStr(S)
#endif

GoalPerceptor *GoalPerceptor::m_UniqueInstance = new GoalPerceptor();

////////////////////////////////////
//Bagian GoalPerceptor
//Constructor
GoalPerceptor::GoalPerceptor() {
    namedWindow("Deteksi Gawang", WINDOW_NORMAL);
    namedWindow("Pre-Processing", WINDOW_NORMAL);
    namedWindow("Properties Gawang", WINDOW_NORMAL);
    namedWindow("Pre-Proc Final", WINDOW_NORMAL);
    namedWindow("Adaptive Thresold", WINDOW_NORMAL);
    for (int i = 0; i <= 500*tan(cam1.GetVerFOV()/2); i += 50) {
        Vector4d temp(i, 0, 500, 1);
        Vector4d temp1(i, 1, 500, 1);
        vertices.push_back(temp);
        vertices.push_back(temp1);
        if (i != 0) {
            Vector4d temp2((-1)*i, 0, 500, 1);
            Vector4d temp3((-1)*i, 1, 500, 1);
            vertices.push_back(temp2);
            vertices.push_back(temp3);
        }
    }
    ROS_INFO("Goal post initialized!!\n");
}

GoalPerceptor::~GoalPerceptor() {}

void GoalPerceptor::init()
{

    initWindow();
    // initTrackbar();
}

void GoalPerceptor::paramCallback(daho_vision::GoalPostConfig &config, uint32_t level) {
    //Color filter
    minB = config.minB;
    maxB = config.maxB;
    minG = config.minG;
    maxG = config.maxG;
    minR = config.minR;
    maxR = config.maxR;

    // Pre-Processing
    yCrop = config.yCrop;
    sigma = config.sigma;
    tetha = config.tetha;
    lambd = config.lambd;
    gamma = config.gamma;

    // Seleksi
    minFieldRatio = config.minFieldRatio;
    maxFieldRatio = config.maxFieldRatio;
    minFieldAtasR = config.minFieldAtasR;
    maxFieldAtasR = config.maxFieldAtasR;

    // Statistik
    minVarian = config.minVarian;
    maxVarian = config.maxVarian;
}
// void GoalPerceptor::init(minIni *ini)
// {
//     loadINI(ini);
//     initWindow();
//     initTrackbar();
// }
/*
void GoalPerceptor::loadINI(minIni *ini)
{
    int value = 0;
    if ((value = ini->geti("Goal Finder", "minB", INVALID_VALUE)) != INVALID_VALUE)
        minB = value;
    if ((value = ini->geti("Goal Finder", "maxB", INVALID_VALUE)) != INVALID_VALUE)
        maxB = value;
    if ((value = ini->geti("Goal Finder", "minG", INVALID_VALUE)) != INVALID_VALUE)
        minG = value;
    if ((value = ini->geti("Goal Finder", "maxG", INVALID_VALUE)) != INVALID_VALUE)
        maxG = value;
    if ((value = ini->geti("Goal Finder", "minR", INVALID_VALUE)) != INVALID_VALUE)
        minR = value;
    if ((value = ini->geti("Goal Finder", "maxR", INVALID_VALUE)) != INVALID_VALUE)
        maxR = value;
    if ((value = ini->geti("Goal Finder", "yCrop", INVALID_VALUE)) != INVALID_VALUE)
        yCrop = value;
    if ((value = ini->geti("Goal Finder", "minFieldRatio", INVALID_VALUE)) != INVALID_VALUE)
        minFieldRatio = value;
    if ((value = ini->geti("Goal Finder", "maxFieldRatio", INVALID_VALUE)) != INVALID_VALUE)
        maxFieldRatio = value;
    if ((value = ini->geti("Goal Finder", "sigma", INVALID_VALUE)) != INVALID_VALUE)
        sigma = value;
    if ((value = ini->geti("Goal Finder", "tetha", INVALID_VALUE)) != INVALID_VALUE)
        tetha = value;
    if ((value = ini->geti("Goal Finder", "lambd", INVALID_VALUE)) != INVALID_VALUE)
        lambd = value;
    if ((value = ini->geti("Goal Finder", "gamma", INVALID_VALUE)) != INVALID_VALUE)
        gamma = value;
    if ((value = ini->geti("Goal Finder", "minVarian", INVALID_VALUE)) != INVALID_VALUE)
        minVarian = value;
    if ((value = ini->geti("Goal Finder", "maxVarian", INVALID_VALUE)) != INVALID_VALUE)
        maxVarian = value;
}

void GoalPerceptor::saveINI(minIni *ini)
{
    ini->put("Goal Finder", "minB", minB);
    ini->put("Goal Finder", "maxB", maxB);
    ini->put("Goal Finder", "minG", minG);
    ini->put("Goal Finder", "maxG", maxG);
    ini->put("Goal Finder", "minR", minR);
    ini->put("Goal Finder", "maxR", maxR);
    ini->put("Goal Finder", "yCrop", yCrop);
    ini->put("Goal Finder", "minFieldRatio", minFieldRatio);
    ini->put("Goal Finder", "maxFieldRatio", maxFieldRatio);
    ini->put("Goal Finder", "sigma", sigma);
    ini->put("Goal Finder", "tetha", tetha);
    ini->put("Goal Finder", "lambd", lambd);
    ini->put("Goal Finder", "gamma", gamma);
    ini->put("Goal Finder", "minVarian", minVarian);
    ini->put("Goal Finder", "maxVarian", maxVarian);
}

void GoalPerceptor::initWindow()
{
    namedWindow("Deteksi Gawang");
    namedWindow("Pre-Processing", WINDOW_NORMAL);
    namedWindow("Properties Gawang", WINDOW_NORMAL);
    namedWindow("Pre-Proc Final", WINDOW_NORMAL);
    namedWindow("Adaptive Thresold", WINDOW_NORMAL);
}
void GoalPerceptor::initTrackbar()
{
    //Morph
    createTrackbar("Min B", "Properties Gawang", &minB, 255, on_trackbar);
    createTrackbar("Max B", "Properties Gawang", &maxB, 255, on_trackbar);
    createTrackbar("Min G", "Properties Gawang", &minG, 255, on_trackbar);
    createTrackbar("Max G", "Properties Gawang", &maxG, 255, on_trackbar);
    createTrackbar("Min R", "Properties Gawang", &minR, 255, on_trackbar);
    createTrackbar("Max R", "Properties Gawang", &maxR, 255, on_trackbar);
    createTrackbar("yCrop", "Properties Gawang", &yCrop, 480, on_trackbar);
    createTrackbar("minFieldRatio", "Properties Gawang", &minFieldRatio, 100, on_trackbar);
    createTrackbar("maxFieldRatio", "Properties Gawang", &maxFieldRatio, 100, on_trackbar);
    createTrackbar("sigma", "Properties Gawang", &sigma, 20);
    createTrackbar("tetha", "Properties Gawang", &tetha, 360);
    createTrackbar("lambd", "Properties Gawang", &lambd, 20);
    createTrackbar("gamma", "Properties Gawang", &gamma, 40);
    createTrackbar("minVarian", "Properties Gawang", &minVarian, 1000);
    createTrackbar("maxVarian", "Properties Gawang", &maxVarian, 7000);
}
*/
// void GoalPerceptor::loadINI(minIni *ini)
// {
//     int value = 0;
//     if ((value = ini->geti("Goal Finder", "minB", INVALID_VALUE)) != INVALID_VALUE)
//         minB = value;
//     if ((value = ini->geti("Goal Finder", "maxB", INVALID_VALUE)) != INVALID_VALUE)
//         maxB = value;
//     if ((value = ini->geti("Goal Finder", "minG", INVALID_VALUE)) != INVALID_VALUE)
//         minG = value;
//     if ((value = ini->geti("Goal Finder", "maxG", INVALID_VALUE)) != INVALID_VALUE)
//         maxG = value;
//     if ((value = ini->geti("Goal Finder", "minR", INVALID_VALUE)) != INVALID_VALUE)
//         minR = value;
//     if ((value = ini->geti("Goal Finder", "maxR", INVALID_VALUE)) != INVALID_VALUE)
//         maxR = value;
//     if ((value = ini->geti("Goal Finder", "yCrop", INVALID_VALUE)) != INVALID_VALUE)
//         yCrop = value;
//     if ((value = ini->geti("Goal Finder", "minFieldRatio", INVALID_VALUE)) != INVALID_VALUE)
//         minFieldRatio = value;
//     if ((value = ini->geti("Goal Finder", "maxFieldRatio", INVALID_VALUE)) != INVALID_VALUE)
//         maxFieldRatio = value;
//     if ((value = ini->geti("Goal Finder", "minFieldAtasR", INVALID_VALUE)) != INVALID_VALUE)
//         minFieldAtasR = value;
//     if ((value = ini->geti("Goal Finder", "maxFieldAtasR", INVALID_VALUE)) != INVALID_VALUE)
//         maxFieldAtasR = value;
//     if ((value = ini->geti("Goal Finder", "sigma", INVALID_VALUE)) != INVALID_VALUE)
//         sigma = value;
//     if ((value = ini->geti("Goal Finder", "tetha", INVALID_VALUE)) != INVALID_VALUE)
//         tetha = value;
//     if ((value = ini->geti("Goal Finder", "lambd", INVALID_VALUE)) != INVALID_VALUE)
//         lambd = value;
//     if ((value = ini->geti("Goal Finder", "gamma", INVALID_VALUE)) != INVALID_VALUE)
//         gamma = value;
//     if ((value = ini->geti("Goal Finder", "minVarian", INVALID_VALUE)) != INVALID_VALUE)
//         minVarian = value;
//     if ((value = ini->geti("Goal Finder", "maxVarian", INVALID_VALUE)) != INVALID_VALUE)
//         maxVarian = value;
// }

// void GoalPerceptor::saveINI(minIni *ini)
// {
//     ini->put("Goal Finder", "minB", minB);
//     ini->put("Goal Finder", "maxB", maxB);
//     ini->put("Goal Finder", "minG", minG);
//     ini->put("Goal Finder", "maxG", maxG);
//     ini->put("Goal Finder", "minR", minR);
//     ini->put("Goal Finder", "maxR", maxR);
//     ini->put("Goal Finder", "yCrop", yCrop);
//     ini->put("Goal Finder", "minFieldRatio", minFieldRatio);
//     ini->put("Goal Finder", "maxFieldRatio", maxFieldRatio);
//     ini->put("Goal Finder", "minFieldAtasR", minFieldAtasR);
//     ini->put("Goal Finder", "maxFieldAtasR", maxFieldAtasR);
//     ini->put("Goal Finder", "sigma", sigma);
//     ini->put("Goal Finder", "tetha", tetha);
//     ini->put("Goal Finder", "lambd", lambd);
//     ini->put("Goal Finder", "gamma", gamma);
//     ini->put("Goal Finder", "minVarian", minVarian);
//     ini->put("Goal Finder", "maxVarian", maxVarian);
// }

void GoalPerceptor::initWindow()
{
    namedWindow("Deteksi Gawang", WINDOW_NORMAL);
    namedWindow("Pre-Processing", WINDOW_NORMAL);
    namedWindow("Properties Gawang", WINDOW_NORMAL);
    namedWindow("Pre-Proc Final", WINDOW_NORMAL);
    namedWindow("Adaptive Thresold", WINDOW_NORMAL);
}
// void GoalPerceptor::initTrackbar()
// {
//     //Morph
//     createTrackbar("Min B", "Properties Gawang", &minB, 255, on_trackbar);
//     createTrackbar("Max B", "Properties Gawang", &maxB, 255, on_trackbar);
//     createTrackbar("Min G", "Properties Gawang", &minG, 255, on_trackbar);
//     createTrackbar("Max G", "Properties Gawang", &maxG, 255, on_trackbar);
//     createTrackbar("Min R", "Properties Gawang", &minR, 255, on_trackbar);
//     createTrackbar("Max R", "Properties Gawang", &maxR, 255, on_trackbar);
//     createTrackbar("yCrop", "Properties Gawang", &yCrop, 480, on_trackbar);

//     createTrackbar("minFieldRatio", "Properties Gawang", &minFieldRatio, 100, on_trackbar);
//     createTrackbar("maxFieldRatio", "Properties Gawang", &maxFieldRatio, 100, on_trackbar);
//     createTrackbar("minFieldRatioAtas", "Properties Gawang", &minFieldAtasR, 100, on_trackbar);
//     createTrackbar("maxFieldRatioAtas", "Properties Gawang", &maxFieldAtasR, 100, on_trackbar);

//     createTrackbar("sigma", "Properties Gawang", &sigma, 20);
//     createTrackbar("tetha", "Properties Gawang", &tetha, 360);
//     createTrackbar("lambd", "Properties Gawang", &lambd, 20);
//     createTrackbar("gamma", "Properties Gawang", &gamma, 40);
//     createTrackbar("minVarian", "Properties Gawang", &minVarian, 1000);
//     createTrackbar("maxVarian", "Properties Gawang", &maxVarian, 7000);
// }
void GoalPerceptor::on_trackbar(int, void *) {}

// Helper function min & max
template <class T>
T min4(T a, T b, T c, T d)
{
    return MIN(MIN(a, b), MIN(c, d));
}

template <class T>
T max4(T a, T b, T c, T d)
{
    return MAX(MAX(a, b), MAX(c, d));
}

//Cek apakah tiang valid dengan mengecek orientasinya
//TODO : Atur batas orientasi sesuai pose kamera
bool tiangValid(RotatedRect boundRect, vector<Vector4d> vertices, Mat &hasil)
{
    Point2f p[4];
    boundRect.points(p);
    /*
    float minX = min4(p[0].x, p[1].x, p[2].x, p[3].x);
    float minY = min4(p[0].y, p[1].y, p[2].y, p[3].y);
    float maxX = max4(p[0].x, p[1].x, p[2].x, p[3].x);
    float maxY = max4(p[0].y, p[1].y, p[2].y, p[3].y);
    */
    Point2f p1, p2;
    int count = 0;
    Size wh = boundRect.size;
    if (wh.width >= wh.height) {
        p1.x = (p[0].x + p[1].x)/2;
        p1.y = (p[0].y + p[1].y)/2;
        p2.x = (p[2].x + p[3].x)/2;
        p2.y = (p[2].y + p[3].y)/2;
    } else {
        p1.x = (p[0].x + p[3].x)/2;
        p1.y = (p[0].y + p[3].y)/2;
        p2.x = (p[1].x + p[2].x)/2;
        p2.y = (p[1].y + p[2].y)/2;
    }
    for (int i = 0; i < vertices.size()/2; i+=2) {
        Point2f s1(vertices[i](0), vertices[i](1));
        Point2f s2(vertices[i + 1](0), vertices[i + 1](1));
        double xAtas = (0 - p1.y)*(p2.x - p1.x)/(p2.y - p1.y) + p1.x; 
        double xBawah = (480 - p1.y)*(p2.x - p1.x)/(p2.y - p1.y) + p1.x;
        double xSAtas = (0 - s1.y)*(s2.x - s1.x)/(s2.y - s1.y) + s1.x;
        double xSBawah = (480 - s1.y)*(s2.x - s1.x)/(s2.y - s1.y) + s1.x;
        line(hasil, Point2f(xSAtas, 0), Point2f(xSBawah, 480), Scalar(0, 0, 255), 1, 8, 0);
        if (abs(xSAtas - xAtas) <= 1 && abs(xSBawah - xBawah) <= 1) {
            count += 1;
        }
    }
    return count > 0;
    //return (abs(boundRect.angle) - 90 < 10) && ((maxY - minY) - (maxX - minX) > 30); //&& (maxX-minX) < 60;
}

//Cek apakah bagian atas tiang bukan lapangan dan bagian bawah ada di sekitar lapangan
bool GoalPerceptor::cekLapangan(RotatedRect boundRect, Mat field)
{
    Point2f p[4];
    boundRect.points(p);
    float maxY = MIN(MAX(MAX(p[0].y, p[1].y), MAX(p[2].y, p[3].y)), 480);
    float minY = MAX(MIN(MIN(p[0].y, p[1].y), MIN(p[2].y, p[3].y)), 0);
    Point2f center = Point2f(boundRect.center.x, maxY);
    Point2f centerAtas = Point2f(boundRect.center.x, minY);
    int lebarBoundBox = 50, lBBAtas = 50;
    int tinggiBoundBox = 10, tBBAtas = 10;
    int awalX = center.x - lebarBoundBox / 2;
    int awalY = center.y - tinggiBoundBox / 2;
    int awalXAtas = centerAtas.x - lebarBoundBox / 2;
    int awalYAtas = centerAtas.y + tinggiBoundBox / 2;

    // printStr("Awal")
    // printExpr(awalX)
    // printExpr(awalY)
    // printExpr(lebarBoundBox)
    // printExpr(tinggiBoundBox)
    if (awalX < 0)
    {
        awalX = 0;
        lebarBoundBox += awalX;
    }
    if (awalX + lebarBoundBox > field.cols)
    {
        lebarBoundBox -= (awalX + lebarBoundBox - field.cols);
    }
    if (awalY < 0)
    {
        awalY = 0;
        tinggiBoundBox += awalY;
    }
    if (awalY + tinggiBoundBox > field.rows)
    {
        tinggiBoundBox -= (awalY + tinggiBoundBox - field.rows);
    }
    // printStr("===============")
    // printExpr(awalX)
    // printExpr(awalY)
    // printExpr(lebarBoundBox)
    // printExpr(tinggiBoundBox)
    // printStr("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
    if (awalXAtas < 0)
    {
        awalXAtas = 0;
        lBBAtas += awalXAtas;
    }
    if (awalXAtas + lBBAtas > field.cols)
    {
        lBBAtas -= (awalXAtas + lBBAtas - field.cols);
    }
    if (awalYAtas < 0)
    {
        awalYAtas = 0;
        tBBAtas += awalYAtas;
    }
    if (awalYAtas + tBBAtas > field.rows)
    {
        tBBAtas -= (awalYAtas + tBBAtas - field.rows);
    }

    Rect boundingBox(awalX, awalY, lebarBoundBox, tinggiBoundBox);
    Rect boundingBoxAtas(awalXAtas, awalYAtas, lBBAtas, tBBAtas);
    // rectangle(image, boundingBox, Scalar(255, 200, 200), 2);
    // rectangle(image, boundingBoxAtas, Scalar(0, 0, 0), 5);
    // imshow("Debug gawang", image);
    Mat maskField = field(boundingBox);
    Mat maskFieldAtas = field(boundingBoxAtas);
    int countNZero = countNonZero(maskField);
    int cNZAtas = countNonZero(maskFieldAtas);
    double rasioLapangan = (double)countNZero / (lebarBoundBox * tinggiBoundBox) * 100.0;
    double rasioLapanganAtas = (double)cNZAtas / (lebarBoundBox * tinggiBoundBox) * 100.0;
    return rasioLapangan >= minFieldRatio && rasioLapangan <= maxFieldRatio && rasioLapanganAtas >= minFieldAtasR && rasioLapanganAtas <= maxFieldAtasR;
}

//Deteksi tiang gawang, m = img dari webcam, field = mask lapangan
void GoalPerceptor::process(Mat m, Mat field)
{
    ROS_INFO("Starting Process!\n");
    //----------------------------Camera Process---------------------------------------
    // TODO 1 : Create a camera thread here until ENDOFTHREAD
    vector<Vector4d> temp;
    Vector3d verticeVector;
    double norm = sqrt(pow(cam1.GetZAxis()(0), 2) + pow(cam1.GetZAxis()(2), 2));
    verticeVector << cam1.GetZAxis()(0)/(norm), 0, cam1.GetZAxis()(2)/(norm);
    Matrix<double, 4, 4> rot;
    rot << verticeVector(2), 0, verticeVector(0), 0,
           0, 1, 0, 0,
           (-1)*verticeVector(0), 0, verticeVector(2), 0,
           0, 0, 0, 1;
    ROS_INFO("size of temp : %d\n", vertices.size());
    for (int i = 0; i < vertices.size(); i+=2) {
        temp.push_back(rot*vertices[i]);
        temp.push_back(rot*vertices[i + 1]);
    }
    ROS_INFO("HELLO\n");
    cam1.Process(temp);
    // ENDOFTHREAD
    //----------------------------End of camera process--------------------------------
    cvtColor(field, field, COLOR_BGR2GRAY);
    //Image Processing
    Mat pp, hasil, gray; //pp = Mat temp untuk pre-processing
    //--------------------------------Color thresholding--------------------------------
    m.copyTo(hasil);
    GaussianBlur(m, pp, Size(3, 3), 0);
    inRange(pp, Scalar(minB, minG, minR), Scalar(maxB, maxG, maxR), pp);
    m.copyTo(pp, pp);
    // imshow("Pre-Processing", pp);
    //--------------------------------Adaptive thresolding--------------------------------
    cvtColor(pp, pp, COLOR_BGR2GRAY);
    GaussianBlur(pp, pp, Size(3, 3), 0);
    GaussianBlur(pp, pp, Size(9, 9), 0);
    adaptiveThreshold(pp, pp, 255, ADAPTIVE_THRESH_GAUSSIAN_C, THRESH_BINARY, 5, 0);
    GaussianBlur(pp, pp, Size(5, 5), 0);
    //--------------------------------Crop setengah atas--------------------------------
    Mat roi = pp(Rect(0, 0, 640, yCrop));
    roi.setTo(Scalar(0, 0, 0));
    //--------------------------------Gabor filter--------------------------------
    Mat hasilGabor1, hasilGabor2;
    Size2i sizeKernel(3, 3);
    Mat gaborKernel1 = getGaborKernel(sizeKernel, sigma, (double)tetha / 360 * CV_2PI, lambd, gamma);
    filter2D(pp, hasilGabor1, pp.depth(), gaborKernel1);
    Mat gaborKernel2 = getGaborKernel(sizeKernel, sigma, (double)(tetha + 180) / 360 * CV_2PI, lambd, gamma);
    filter2D(pp, hasilGabor2, pp.depth(), gaborKernel2);
    bitwise_or(hasilGabor1, hasilGabor2, pp);
    bitwise_not(field, field);
    bitwise_and(pp, field, pp);
    bitwise_not(field, field);
    Mat ppDebug;
    m.copyTo(ppDebug, pp);
    // cout << "Ini Gambarnya" << endl;
    imshow("Pre-Proc Final", ppDebug);
    // resize(gab, gab, Size(300, 300));
    // imshow("Gabor filter", gab);
    //--------------------------------Contour detection--------------------------------
    vector<vector<Point>> contours;
    findContours(pp, contours, RETR_TREE, CHAIN_APPROX_SIMPLE);
    //--------------------------------Seleksi contours yang sesuai & tampilkan--------------------------------
    xGoalPost.clear();
    cArea.clear();
    totalAreaContour = 0;
    // TODO 2 : Join the Camera Thread
    for (vector<Point> c : contours)
    {
        RotatedRect boundRect = minAreaRect(c);
        // TODO 3 : multithread antara cek tiang dengan cek lapangan
        if (tiangValid(boundRect, temp, hasil))
        {
            //Cek lapangan
            if (cekLapangan(boundRect, field))
            {
                xGoalPost.push_back(boundRect.center.x);
                double area = contourArea(c);
                cArea.push_back(area);
                totalAreaContour += area;
                Point2f rect_points[4];
                boundRect.points(rect_points);
                for (int j = 0; j < 4; j++)
                {
                    line(hasil, rect_points[j], rect_points[(j + 1) % 4], Scalar(255, 0, 0), 4);
                }
                putText(hasil, to_string(boundRect.angle), boundRect.center, FONT_HERSHEY_PLAIN, 2, Scalar(0, 255, 0), 2);
            }
        }
    }
    ROS_INFO("END Process!\n");
    imshow("Deteksi Gawang", hasil);
    waitKey(1);
}

//Probability Mass Function setiap kandidat gawang
//Digunakan di Behavior bersamaan dengan minVarian & maxVarian
double GoalPerceptor::getContourPMF(int idx)
{
    if (idx >= 0 && idx < cArea.size())
    {
        return cArea[idx] / totalAreaContour;
    }
    else
    {
        return 0;
    }
}

//Helper function Linear Interpolation
double normValue(double from, double fromMin, double fromMax, double toMin, double toMax)
{
    return fromMin + from * (toMax - toMin) / (fromMax - fromMin);
}