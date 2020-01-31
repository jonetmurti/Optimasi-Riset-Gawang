# include "daho_vision/cameraTransform.h"
# include <math.h>

CameraTrans::CameraTrans() {
    nearZ = 400;
    farZ = 700;
    verFOV = ToRadian(78);
    aspectRat = SC_WIDTH/SC_HEIGHT;
    xAxis << 1, 0, 0;
    yAxis << 0, 1, 0;
    zAxis << 0, 0, 1;
    //yAxis << 0, 1/sqrt(2), (-1)*1/sqrt(2);
    //zAxis << 0, 1/sqrt(2), 1/sqrt(2);
}

CameraTrans::~CameraTrans() {

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

Vector3d CameraTrans::GetZAxis() {
    return zAxis;
}

Vector3d CameraTrans::GetYAxis() {
    return yAxis;
}

Vector3d CameraTrans::GetXAxis() {
    return xAxis;
}

void CameraTrans::SetNearZ(double val) {
    nearZ = val;
}

void CameraTrans::SetFarZ(double val) {
    farZ = val;
}

void CameraTrans::SetVerFOV(double angle) {
    verFOV = ToRadian(angle);
}

void CameraTrans::SetZAxis(double i, double j, double k) {
    zAxis << i, j, k;
}

void CameraTrans::SetYAxis(double i, double j, double k) {
    yAxis << i, j, k;
}

void CameraTrans::SetXAxis(double i, double j, double k) {
    xAxis << i, j, k;
}

void CameraTrans::AxisSetup() {
    Normalize(1);
    Normalize(2);
    double i, j, k;
    i = yAxis(1)*zAxis(2) - yAxis(2)*zAxis(1);
    j = yAxis(2)*zAxis(0) - yAxis(0)*zAxis(2);
    k = yAxis(0)*zAxis(1) - yAxis(1)*zAxis(0);
    SetXAxis(i, j, k);
    Normalize(0);
}

void CameraTrans::Normalize(int axis) {
    double length;
    if (axis = 0) {
        length = sqrt(pow(xAxis(0), 2) + pow(xAxis(1), 2) + pow(xAxis(2), 2));
        xAxis(0) /= length;
        xAxis(1) /= length;
        xAxis(2) /= length;
    } else if (axis = 1) {
        length = sqrt(pow(yAxis(0), 2) + pow(yAxis(1), 2) + pow(yAxis(2), 2));
        yAxis(0) /= length;
        yAxis(1) /= length;
        yAxis(2) /= length;
    } else {
        length = sqrt(pow(zAxis(0), 2) + pow(zAxis(1), 2) + pow(zAxis(2), 2));
        zAxis(0) /= length;
        zAxis(1) /= length;
        zAxis(2) /= length;
    }
}

void CameraTrans::CreatePersProjMat() {
    // Should be of matrix type
    persProjectMat << 1/(aspectRat*tan(verFOV/2)), 0, 0, 0,
                      0, 1/tan(verFOV/2), 0, 0,
                      0, 0, ((-1)*nearZ - farZ)/(nearZ - farZ), (2*farZ*nearZ)/(nearZ - farZ),
                      0, 0, 1, 0;
}

void CameraTrans::CreateTranslationMat(double v1, double v2, double v3) { 
    // Should be of matrix type
    translationMat << 1, 0, 0, v1,
                      0, 1, 0, v2,
                      0, 0, 1, v3,
                      0, 0, 0, 1;

}

void CameraTrans::CreateRotationMat() {
    rotationMat << xAxis(0), xAxis(1), xAxis(2), 0,
                   yAxis(0), yAxis(1), yAxis(2), 0,
                   zAxis(0), zAxis(1), zAxis(2), 0,
                   0, 0, 0, 1;
}

void CameraTrans::CreateScaleMat(double kx, double ky, double kz) {
    scaleMat << kx, 0, 0, 0,
                0, ky, 0, 0,
                0, 0, kz, 0,
                0, 0, 0, 1;
}

Matrix<double, 3, 1> CameraTrans::ThreeD2TwoD(Matrix<double, 4, 1> point) {

}

void CameraTrans::CreateTransformMat() {
    transformMat = persProjectMat * rotationMat * translationMat * scaleMat;
}

void CameraTrans::Process(vector<Vector4d> &vertices) {
    AxisSetup();
    CreateScaleMat(1, 1, 1);
    CreateTranslationMat(0, 0, -21.5); //Sesuaikan dengan tinggi robot
    CreateRotationMat();
    CreatePersProjMat();
    CreateTransformMat();
    for (int i = 0; i < vertices.size(); i++) {
        vertices[i] = transformMat*vertices[i];
        vertices[i](0) /= vertices[i](3);
        vertices[i](1) /= vertices[i](3);
        vertices[i](2) /= vertices[i](3);
        vertices[i](0) = 640.0/2 - cm2pixel(4*aspectRat*vertices[i](0));
        vertices[i](1) = 480.0/2 - cm2pixel(vertices[i](1));
    }
}