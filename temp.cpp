# include <iostream>
# include "math.h"
# include "opencv2/highgui.hpp"
# include "opencv2/imgproc.hpp"

using namespace std;
using namespace cv;

# define M_PI 3.14159265358979323846
# define ToRadian(X) ((X)*M_PI/180.0)
# define ToDegree(X) ((X)*180.0/M_PI)

void name(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        arr[i] += 5;    
    }
}

int main () {
    Mat A;
    cout << A.total() << endl;
    return 0;
}