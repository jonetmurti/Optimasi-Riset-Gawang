/*
    CAMERA TRANSFORM (transform 3d to 2d)

    Author      : Jonet Wira Murti (13518083)
    Description : This camera transform use the pinhole camera model for transformation from 3d space to 2d space.
                  Other alternative : lens camera model (I'll try it later).
*/

# include <iostream>
# include <vector>

using namespace std;

class CameraTrans {
    private :
        double nearZ, farZ;
        double verFOV; // Should be in radian
        vector<double> zAxis, yAxis, xAxis; // Get data from forward kinematics
        Matrix<double, 4, 4> viewMat, orientationMat;
    public :
        CameraTrans();
        ~CameraTrans();

        double GetNearZ();
        double GetFarZ();
        double GetVerFOV();
        vector<double> GetZAxis();
        vector<double> GetYAxis();
        vector<double> GetXAxis();

        void SetNearZ(double val);
        void SetFarZ(double val);
        void SetVerFOV(double angle);
        void SetZAxis(double i, double j, double k);
        void SetYAxis(double i, double j, double k);
        void SetXAxis(double i, double j, double k);

        vector<double> CalculateXAxis(); // Calculate using the cross product of Y and Z axis

        void CreateViewMatrix(); // Should be of matrix type
        void CreateOrientationMatrix(); // Should be of matrix type

        Matrix<double, 3, 1> ThreeD2TwoD(Matrix<double, 4, 1> point);
};