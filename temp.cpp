# include <iostream>
# include "math.h"
# include "opencv2/highgui.hpp"
# include "opencv2/imgproc.hpp"
# include "cameraTransform.h"

using namespace std;
using namespace cv;

# define M_PI 3.14159265358979323846
# define ToRadian(X) ((X)*M_PI/180.0)
# define ToDegree(X) ((X)*180.0/M_PI)

void roiTest() {
    Mat test(SC_HEIGHT, SC_WIDTH, CV_8UC3);

    Point2f A, B;
    A.x = 800;
    A.y = 600;
    B.x = 640.0/2;
    B.y = 480.0/2;

    line(test, A, B, Scalar(255, 255, 255), 2, 8, 0);

    imshow("test", test);
    waitKey(0);
}

void lineDrawTest() {
    cameraTrans cam1;
    double ar = 640.0/480.0;
    vector<Vector4d> vertices;
    Vector4d p1, p2, p3, p4;
    for (int i = 0; i <= 500*tan(ToRadian(78/2)); i += 50) {
            p1 << i, 0, 500, 1;
            p2 << i, 1, 500, 1;
            vertices.push_back(p1);
            vertices.push_back(p2);
            if (i > 0) {
                p3 << (-1)*i, 0, 500, 1;
                p4 << (-1)*i, 1, 500, 1;
                vertices.push_back(p3);
                vertices.push_back(p4);
            }
    }
    cam1.Process(vertices);
    vector<Point2f> point;
    Point2f temp;
    for (int i = 0; i < vertices.size(); i++) {
        temp.x = ar*vertices[0];
        temp.y = vertices[1];
        point.push_back(temp);
    }

    Mat pict(SC_HEIGHT, SC_WIDTH, CV_8UC3);
    for (int i = 0; i < point.size(); i+=2) {
        line(pict, point[i], point[i + 1], Scalar(255, 255, 255), 1, 8, 0);
    }

    imshow("Line Sample", pict);
    waitKey(0);
}

int main () {
    roiTest();
    lineDrawTest();
    return 0;
}