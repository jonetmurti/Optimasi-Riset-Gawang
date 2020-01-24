# include <iostream>
# include "cameraTransform.h"
# include "opencv2/imgproc.hpp"
# include "opencv2/highgui.hpp"
# include "eigen3/Eigen/Dense"

using namespace std;
using namespace cv;
using namespace Eigen;

int main () {

    Mat pict1(SC_HEIGHT, SC_WIDTH, CV_8UC3), pict2(SC_HEIGHT, SC_WIDTH, CV_8UC3);
    Vector4f p1, p2, p3, p4;
    CameraTrans cam1(0);
    CameraTrans cam2(1);

    double ar = 640.0/480.0;
    Point origin;
    origin.x = SC_WIDTH/2;
    origin.y = SC_HEIGHT/2;
    Point axis[4];
    axis[0].x = origin.x + SC_WIDTH/2;
    axis[0].y = origin.y;
    axis[1].x = origin.x - SC_WIDTH/2;
    axis[1].y = origin.y;
    axis[2].x = origin.x;
    axis[2].y = origin.y - SC_HEIGHT/2;
    axis[3].x = origin.x;
    axis[3].y = origin.y + SC_HEIGHT/2;
    //line(pict1, axis[0], axis[1], Scalar(255, 255, 255), 2, 8, 0);
    //line(pict1, axis[2], axis[3], Scalar(255, 255, 255), 2, 8, 0);

    //line(pict2, axis[0], axis[1], Scalar(255, 255, 255), 2, 8, 0);
    //line(pict2, axis[2], axis[3], Scalar(255, 255, 255), 2, 8, 0);

    Vector4d first[8];
    Vector4d second[8];

    first[0] << 0, 5, 12, 1;
    first[1] << 5/sqrt(2), 5, 12+5/sqrt(2), 1;
    first[2] << 0, 5, (5*sqrt(2) + 12), 1;
    first[3] << (-1)*5/sqrt(2), 5, 12+5/sqrt(2), 1;
    first[4] << 0, 0, 12, 1;
    first[5] << 5/sqrt(2), 0, 12+5/sqrt(2), 1;
    first[6] << 0, 0, (5*sqrt(2) + 12), 1;
    first[7] << (-1)*5/sqrt(2), 0, 12+5/sqrt(2), 1;

    second[0] << 0, 5, 12, 1;
    second[1] << 5/sqrt(2), 5, 12+5/sqrt(2), 1;
    second[2] << 0, 5, (5*sqrt(2) + 12), 1;
    second[3] << (-1)*5/sqrt(2), 5, 12+5/sqrt(2), 1;
    second[4] << 0, 0, 12, 1;
    second[5] << 5/sqrt(2), 0, 12+5/sqrt(2), 1;
    second[6] << 0, 0, (5*sqrt(2) + 12), 1;
    second[7] << (-1)*5/sqrt(2), 0, 12+5/sqrt(2), 1;

    cam1.Process(first, 8);
    cam2.Process(second, 8);

    for (int i = 0; i < 8; i++) {
        first[i](0) *= ar * 2;
        second[i](0) *= ar * 2;
        first[i](1) *= 2;
        second[i](1) *= 2;
    }

    Point vertices1[8];
    Point vertices2[8];

    for (int i = 0; i < 8; i++) {
        vertices1[i].x = origin.x + cm2pixel(first[i](0));
        vertices1[i].y = origin.y - cm2pixel(first[i](1));
        vertices2[i].x = origin.x + cm2pixel(second[i](0));
        vertices2[i].y = origin.y - cm2pixel(second[i](1));
        cout << i + 1 << endl;
        cout << vertices1[i] << endl;
    }
    /*
    vertices1[0].x = origin.x + cm2pixel(first[0](0));
    vertices1[0].y = origin.y - cm2pixel(first[0](1));
    vertices1[1].x = origin.x + cm2pixel(first[1](0));
    vertices1[1].y = origin.y - cm2pixel(first[1](1));
    vertices1[2].x = origin.x + cm2pixel(first[2](0));
    vertices1[2].y = origin.y - cm2pixel(first[2](1));
    vertices1[3].x = origin.x + cm2pixel(first[3](0));
    vertices1[3].y = origin.y - cm2pixel(first[3](1));
    vertices1[4].x = origin.x + cm2pixel(first[4](0));
    vertices1[4].y = origin.y - cm2pixel(first[4](1));
    vertices1[5].x = origin.x + cm2pixel(first[5](0));
    vertices1[5].y = origin.y - cm2pixel(first[5](1));
    vertices1[6].x = origin.x + cm2pixel(first[6](0));
    vertices1[6].y = origin.y - cm2pixel(first[6](1));
    vertices1[7].x = origin.x + cm2pixel(first[7](0));
    vertices1[7].y = origin.y - cm2pixel(first[7](1));
    */

    /*
    //Box 1
    vertices1[0].x = origin.x - 40;
    vertices1[0].y = origin.y - 10;
    vertices1[1].x = origin.x - 40;
    vertices1[1].y = origin.y + 10;
    vertices1[2].x = origin.x - 20;
    vertices1[2].y = origin.y + 10;
    vertices1[3].x = origin.x - 20;
    vertices1[3].y = origin.y - 10; 
    //Box 2
    vertices1[4].x = origin.x + 20;
    vertices1[4].y = origin.y - 10;
    vertices1[5].x = origin.x + 20;
    vertices1[5].y = origin.y + 10;
    vertices1[6].x = origin.x + 40;
    vertices1[6].y = origin.y + 10;
    vertices1[7].x = origin.x + 40;
    vertices1[7].y = origin.y - 10;
    //Box 3
    vertices1[8].y = origin.y - 40;
    vertices1[8].x = origin.x - 10;
    vertices1[9].y = origin.y - 40;
    vertices1[9].x = origin.x + 10;
    vertices1[10].y = origin.y - 20;
    vertices1[10].x = origin.x + 10;
    vertices1[11].y = origin.y - 20;
    vertices1[11].x = origin.x - 10;
    //Box 4
    vertices1[12].y = origin.y + 20;
    vertices1[12].x = origin.x - 10;
    vertices1[13].y = origin.y + 20;
    vertices1[13].x = origin.x + 10;
    vertices1[14].y = origin.y + 40;
    vertices1[14].x = origin.x + 10;
    vertices1[15].y = origin.y + 40;
    vertices1[15].x = origin.x - 10;
    //Box 5
    vertices1[16].x = origin.x - 10;
    vertices1[16].y = origin.y - 10;
    vertices1[17].x = origin.x - 10;
    vertices1[17].y = origin.y + 10;
    vertices1[18].x = origin.x + 10;
    vertices1[18].y = origin.y + 10;
    vertices1[19].x = origin.x + 10;
    vertices1[19].y = origin.y - 10;

    for (int i = 0; i < 20; i++) {
        vertices2[i].x = 2*(vertices1[i].x - origin.x) + origin.x;
        vertices2[i].y = 2*(vertices1[i].y - origin.y) + origin.y;
    }
    */

   /*
    int add = 0;
    int i = 0;
    while(i < 8) {
        if (i%4 == 3) {
            line(pict1, vertices1[i], vertices1[i - 3], Scalar(255,255,255), 2, 8, 0);
            line(pict2, vertices2[i], vertices2[i - 3], Scalar(255,255,255), 2, 8, 0);
        } else {
            line(pict1, vertices1[i], vertices1[i + 1], Scalar(255,255,255), 2, 8, 0);
            line(pict2, vertices2[i], vertices2[i + 1], Scalar(255,255,255), 2, 8, 0);
        }
        if (i < 4) {
            line(pict1, vertices1[i], vertices1[i + 4], Scalar(255,255,255), 2, 8, 0);
            line(pict2, vertices2[i], vertices2[i + 4], Scalar(255,255,255), 2, 8, 0);
        }
        i += 1;
    }
    */
   line(pict1, vertices1[0], vertices1[1], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[0], vertices1[3], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[0], vertices1[4], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[4], vertices1[5], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[4], vertices1[7], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[1], vertices1[5], Scalar(255,255,255), 2, 8, 0);
   line(pict1, vertices1[3], vertices1[7], Scalar(255,255,255), 2, 8, 0);

    
    line(pict2, vertices2[0], vertices2[1], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[0], vertices2[3], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[1], vertices2[2], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[2], vertices2[3], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[0], vertices2[4], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[4], vertices2[5], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[4], vertices2[7], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[1], vertices2[5], Scalar(255,255,255), 2, 8, 0);
    line(pict2, vertices2[3], vertices2[7], Scalar(255,255,255), 2, 8, 0);
    
   /*
    circle(pict2, vertices2[0], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[1], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[2], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[3], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[4], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[5], 2, Scalar(255,255,255), 2, 8, 0);
    circle(pict2, vertices2[7], 2, Scalar(255,255,255), 2, 8, 0);
    */

    cout << cam1.GetTranslationMat() << endl;
    cout << cam1.GetRotMat() << endl;
    cout << cam1.GetPersProj() << endl;
    cout << cam1.GetTransMat() << endl;

    imshow("pict1", pict1);
    imshow("pict2", pict2);
    waitKey(0);

    return 0;
}