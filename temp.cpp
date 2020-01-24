# include <iostream>
# include "math.h"

using namespace std;

# define M_PI 3.14159265358979323846
# define ToRadian(X) ((X)*M_PI/180.0)
# define ToDegree(X) ((X)*180.0/M_PI)

int main () {
    double angle = atan(1/2.0);
    cout << ToDegree(angle) << endl;

    return 0;
}