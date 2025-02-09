// Generated by gencpp from file daho_vision/ContourPMF.msg
// DO NOT EDIT!


#ifndef DAHO_VISION_MESSAGE_CONTOURPMF_H
#define DAHO_VISION_MESSAGE_CONTOURPMF_H

#include <ros/service_traits.h>


#include <daho_vision/ContourPMFRequest.h>
#include <daho_vision/ContourPMFResponse.h>


namespace daho_vision
{

struct ContourPMF
{

typedef ContourPMFRequest Request;
typedef ContourPMFResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ContourPMF
} // namespace daho_vision


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::daho_vision::ContourPMF > {
  static const char* value()
  {
    return "4bb5d9f5e6e30948bd500fd3fb78b38b";
  }

  static const char* value(const ::daho_vision::ContourPMF&) { return value(); }
};

template<>
struct DataType< ::daho_vision::ContourPMF > {
  static const char* value()
  {
    return "daho_vision/ContourPMF";
  }

  static const char* value(const ::daho_vision::ContourPMF&) { return value(); }
};


// service_traits::MD5Sum< ::daho_vision::ContourPMFRequest> should match 
// service_traits::MD5Sum< ::daho_vision::ContourPMF > 
template<>
struct MD5Sum< ::daho_vision::ContourPMFRequest>
{
  static const char* value()
  {
    return MD5Sum< ::daho_vision::ContourPMF >::value();
  }
  static const char* value(const ::daho_vision::ContourPMFRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::daho_vision::ContourPMFRequest> should match 
// service_traits::DataType< ::daho_vision::ContourPMF > 
template<>
struct DataType< ::daho_vision::ContourPMFRequest>
{
  static const char* value()
  {
    return DataType< ::daho_vision::ContourPMF >::value();
  }
  static const char* value(const ::daho_vision::ContourPMFRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::daho_vision::ContourPMFResponse> should match 
// service_traits::MD5Sum< ::daho_vision::ContourPMF > 
template<>
struct MD5Sum< ::daho_vision::ContourPMFResponse>
{
  static const char* value()
  {
    return MD5Sum< ::daho_vision::ContourPMF >::value();
  }
  static const char* value(const ::daho_vision::ContourPMFResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::daho_vision::ContourPMFResponse> should match 
// service_traits::DataType< ::daho_vision::ContourPMF > 
template<>
struct DataType< ::daho_vision::ContourPMFResponse>
{
  static const char* value()
  {
    return DataType< ::daho_vision::ContourPMF >::value();
  }
  static const char* value(const ::daho_vision::ContourPMFResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DAHO_VISION_MESSAGE_CONTOURPMF_H
