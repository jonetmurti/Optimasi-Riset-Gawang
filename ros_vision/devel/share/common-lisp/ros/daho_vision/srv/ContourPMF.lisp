; Auto-generated. Do not edit!


(cl:in-package daho_vision-srv)


;//! \htmlinclude ContourPMF-request.msg.html

(cl:defclass <ContourPMF-request> (roslisp-msg-protocol:ros-message)
  ((idx
    :reader idx
    :initarg :idx
    :type cl:integer
    :initform 0))
)

(cl:defclass ContourPMF-request (<ContourPMF-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContourPMF-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContourPMF-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name daho_vision-srv:<ContourPMF-request> is deprecated: use daho_vision-srv:ContourPMF-request instead.")))

(cl:ensure-generic-function 'idx-val :lambda-list '(m))
(cl:defmethod idx-val ((m <ContourPMF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-srv:idx-val is deprecated.  Use daho_vision-srv:idx instead.")
  (idx m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContourPMF-request>) ostream)
  "Serializes a message object of type '<ContourPMF-request>"
  (cl:let* ((signed (cl:slot-value msg 'idx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContourPMF-request>) istream)
  "Deserializes a message object of type '<ContourPMF-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idx) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContourPMF-request>)))
  "Returns string type for a service object of type '<ContourPMF-request>"
  "daho_vision/ContourPMFRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContourPMF-request)))
  "Returns string type for a service object of type 'ContourPMF-request"
  "daho_vision/ContourPMFRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContourPMF-request>)))
  "Returns md5sum for a message object of type '<ContourPMF-request>"
  "4bb5d9f5e6e30948bd500fd3fb78b38b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContourPMF-request)))
  "Returns md5sum for a message object of type 'ContourPMF-request"
  "4bb5d9f5e6e30948bd500fd3fb78b38b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContourPMF-request>)))
  "Returns full string definition for message of type '<ContourPMF-request>"
  (cl:format cl:nil "int64 idx~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContourPMF-request)))
  "Returns full string definition for message of type 'ContourPMF-request"
  (cl:format cl:nil "int64 idx~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContourPMF-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContourPMF-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ContourPMF-request
    (cl:cons ':idx (idx msg))
))
;//! \htmlinclude ContourPMF-response.msg.html

(cl:defclass <ContourPMF-response> (roslisp-msg-protocol:ros-message)
  ((ratio
    :reader ratio
    :initarg :ratio
    :type cl:float
    :initform 0.0))
)

(cl:defclass ContourPMF-response (<ContourPMF-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContourPMF-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContourPMF-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name daho_vision-srv:<ContourPMF-response> is deprecated: use daho_vision-srv:ContourPMF-response instead.")))

(cl:ensure-generic-function 'ratio-val :lambda-list '(m))
(cl:defmethod ratio-val ((m <ContourPMF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-srv:ratio-val is deprecated.  Use daho_vision-srv:ratio instead.")
  (ratio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContourPMF-response>) ostream)
  "Serializes a message object of type '<ContourPMF-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContourPMF-response>) istream)
  "Deserializes a message object of type '<ContourPMF-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ratio) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContourPMF-response>)))
  "Returns string type for a service object of type '<ContourPMF-response>"
  "daho_vision/ContourPMFResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContourPMF-response)))
  "Returns string type for a service object of type 'ContourPMF-response"
  "daho_vision/ContourPMFResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContourPMF-response>)))
  "Returns md5sum for a message object of type '<ContourPMF-response>"
  "4bb5d9f5e6e30948bd500fd3fb78b38b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContourPMF-response)))
  "Returns md5sum for a message object of type 'ContourPMF-response"
  "4bb5d9f5e6e30948bd500fd3fb78b38b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContourPMF-response>)))
  "Returns full string definition for message of type '<ContourPMF-response>"
  (cl:format cl:nil "float64 ratio~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContourPMF-response)))
  "Returns full string definition for message of type 'ContourPMF-response"
  (cl:format cl:nil "float64 ratio~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContourPMF-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContourPMF-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ContourPMF-response
    (cl:cons ':ratio (ratio msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ContourPMF)))
  'ContourPMF-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ContourPMF)))
  'ContourPMF-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContourPMF)))
  "Returns string type for a service object of type '<ContourPMF>"
  "daho_vision/ContourPMF")