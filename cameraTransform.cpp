# include "cameraTransform.h"
# include <math.h>

#define M_PI 3.14159265358979323846

CameraTrans::CameraTrans() {
    SetNearZ(0);
    SetFarZ(0);
    SetVerFOV(0);
    CreateViewMatrix();
}

double CameraTrans::GetNearZ() {
    return nearZ;
}

double CameraTrans::GetFarZ() {
    return farZ;
}

double CameraTrans::GetVerFOV() {
    return verFOV;
}

vector<double> CameraTrans::GetZAxis() {
    return zAxis;
}

vector<double> CameraTrans::GetYAxis() {
    return yAxis;
}

vector<double> CameraTrans::GetXAxis() {
    return xAxis;
}

void CameraTrans::SetNearZ(double val) {
    nearZ = val;
}

void CameraTrans::SetFarZ(double val) {
    farZ = val;
}

void CameraTrans::SetVerFOV(double angle) {
    double radian = (angle * M_PI) / 180.0;
    verFOV = radian;
}

void CameraTrans::SetZAxis(double i, double j, double k) {
    if (!(zAxis.empty())) {
        zAxis.clear();
    }
    zAxis.push_back(i);
    zAxis.push_back(j);
    zAxis.push_back(k);
}

void CameraTrans::SetYAxis(double i, double j, double k) {
    if (!(yAxis.empty())) {
        yAxis.clear();
    }
    yAxis.push_back(i);
    yAxis.push_back(j);
    yAxis.push_back(k);
}

void CameraTrans::SetXAxis(double i, double j, double k) {
    if (!(xAxis.empty())) {
        xAxis.clear();
    }
    xAxis.push_back(i);
    xAxis.push_back(j);
    xAxis.push_back(k);
}

vector<double> CameraTrans::CalculateXAxis() {
    // Calculate using the cross product of Y and Z axis
    double i = yAxis[1]*zAxis[2] - yAxis[2]*zAxis[1];
    double j = yAxis[0]*zAxis[2] - yAxis[2]*zAxis[0];
    double k = yAxis[0]*zAxis[1] - yAxis[1]*zAxis[0];
    SetXAxis(i, j, k);
}

void CameraTrans::CreateViewMatrix() {
    // Should be of matrix type
    viewMat << 1/tan(verFOV/2), 0, 0, 0,
               0, 1/tan(verFOV/2), 0, 0,
               0, 0, ((-1)*nearZ - farZ)/(nearZ - farZ), (2*farZ*nearZ)/(nearZ - farZ),
               0, 0, 1, 0;
}

void CameraTrans::CreateOrientationMatrix() { 
    // Should be of matrix type
    orientationMat << 1, 0, 0, 0,
                      0, 1, 0, 0,
                      0, 0, 1, 0,
                      0, 0, 0, 1;
}

Matrix<double, 3, 1> CameraTrans::ThreeD2TwoD(Matrix<double, 4, 1> point) {
    
}