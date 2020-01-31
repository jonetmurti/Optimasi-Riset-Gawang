#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "daho_vision/FieldDetector.h"
// #include "daho_vision/HasilField.h"
#include "dynamic_reconfigure/server.h"

class field_detection_node
{
private:
    ros::NodeHandle nh;
    image_transport::ImageTransport it;
    image_transport::Publisher field_mask;
    image_transport::Subscriber real_image;
    Robot::FieldDetector field_detector;
    Mat realImage, fieldMask;

public:
    field_detection_node() : it(nh)
    {
        real_image = it.subscribe("/capture/image_raw", 1, &field_detection_node::realImageImageCallback, this);
        field_mask = it.advertise("/field_detection/field_mask", 1);
    }

    void realImageImageCallback(const sensor_msgs::ImageConstPtr &msg)
    {
        cv_bridge::CvImagePtr cv_ptr_image_real;
        try
        {
            cv_ptr_image_real = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        }
        catch (cv_bridge::Exception &e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }
        realImage = cv_ptr_image_real->image;
        processImage();
    }

    void processImage()
    {
        field_detector.Process(realImage);
        fieldMask = field_detector.getFieldMask();
        
        cv_bridge::CvImagePtr cv_ptr_field_mask(new cv_bridge::CvImage);
        ros::Time time = ros::Time::now();
        cv_ptr_field_mask->encoding = "bgr8";
        cv_ptr_field_mask->header.stamp = time;
        cv_ptr_field_mask->header.frame_id = "/field_detection/field_mask";
        cv_ptr_field_mask->image = fieldMask;
        // ROS_ERROR_STREAM("chan1" << fieldMask.channels() << endl);
        field_mask.publish(cv_ptr_field_mask->toImageMsg());
    }

    void paramCallback(daho_vision::FieldConfig &config, uint32_t level)
    {
        field_detector.paramCallback(config, level);
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "field_detection_node");
    field_detection_node fdn;

    dynamic_reconfigure::Server<daho_vision::FieldConfig> server;
    dynamic_reconfigure::Server<daho_vision::FieldConfig>::CallbackType f;

    f = boost::bind(&field_detection_node::paramCallback, &fdn, _1, _2);
    server.setCallback(f);

    ros::spin();

    return 0;
}