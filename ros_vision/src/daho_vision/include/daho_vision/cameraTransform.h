/*
    CAMERA TRANSFORM (transform 3d to 2d)

    Author      : Jonet Wira Murti (13518083)
    Description : This camera transform use the pinhole camera model for transformation from 3d space to 2d space.
                  Other alternative : lens camera model (I'll try it later).
*/

# include <iostream>
# include <eigen3/Eigen/Dense>
# include <vector>

using namespace std;
using namespace Eigen;

# define M_PI 3.14159265358979323846
# define ToRadian(X) ((X)*M_PI/180.0)
# define ToDegree(X) ((X)*180.0/M_PI)
# define cm2pixel(X) ((X)/0.026458333)
# define pixel2cm(X) ((X)*0.026458333)
# define SC_WIDTH 640.0
# define SC_HEIGHT 480.0

class CameraTrans {
    private :
        double nearZ, farZ;
        double verFOV; // Should be in radian
        double aspectRat;
        double trans;
        Vector3d zAxis, yAxis, xAxis; // Get data from forward kinematics
        Matrix<double, 4, 4> persProjectMat, translationMat, rotationMat, scaleMat, transformMat;
    public :
        CameraTrans();
        ~CameraTrans();

        double GetNearZ();
        double GetFarZ();
        double GetVerFOV();
        Vector3d GetZAxis();
        Vector3d GetYAxis();
        Vector3d GetXAxis();
        Matrix<double, 4, 4> GetPersProj() {return persProjectMat;};
        Matrix<double, 4, 4> GetTransMat() {return transformMat;};
        Matrix<double, 4, 4> GetRotMat() {return rotationMat;};
        Matrix<double, 4, 4> GetTranslationMat() {return translationMat;};

        void SetNearZ(double val);
        void SetFarZ(double val);
        void SetVerFOV(double angle);
        void SetZAxis(double i, double j, double k);
        void SetYAxis(double i, double j, double k);
        void SetXAxis(double i, double j, double k);

        Vector3d cross();
        void AxisSetup();
        void Normalize(int axis);

        void CreatePersProjMat();
        void CreateTranslationMat(double v1, double v2, double v3);
        void CreateRotationMat();
        void CreateScaleMat(double kx, double ky, double kz);
        void CreateTransformMat();
        void Process(vector<Vector4d> &vertices);

        Matrix<double, 3, 1> ThreeD2TwoD(Matrix<double, 4, 1> point);
};