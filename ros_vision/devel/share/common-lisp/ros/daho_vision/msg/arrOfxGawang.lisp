; Auto-generated. Do not edit!


(cl:in-package daho_vision-msg)


;//! \htmlinclude arrOfxGawang.msg.html

(cl:defclass <arrOfxGawang> (roslisp-msg-protocol:ros-message)
  ((xComponent
    :reader xComponent
    :initarg :xComponent
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass arrOfxGawang (<arrOfxGawang>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arrOfxGawang>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arrOfxGawang)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name daho_vision-msg:<arrOfxGawang> is deprecated: use daho_vision-msg:arrOfxGawang instead.")))

(cl:ensure-generic-function 'xComponent-val :lambda-list '(m))
(cl:defmethod xComponent-val ((m <arrOfxGawang>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-msg:xComponent-val is deprecated.  Use daho_vision-msg:xComponent instead.")
  (xComponent m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arrOfxGawang>) ostream)
  "Serializes a message object of type '<arrOfxGawang>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'xComponent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'xComponent))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arrOfxGawang>) istream)
  "Deserializes a message object of type '<arrOfxGawang>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'xComponent) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'xComponent)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arrOfxGawang>)))
  "Returns string type for a message object of type '<arrOfxGawang>"
  "daho_vision/arrOfxGawang")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arrOfxGawang)))
  "Returns string type for a message object of type 'arrOfxGawang"
  "daho_vision/arrOfxGawang")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arrOfxGawang>)))
  "Returns md5sum for a message object of type '<arrOfxGawang>"
  "dbd9af7d26d3b4c7d9623e5d36caf99c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arrOfxGawang)))
  "Returns md5sum for a message object of type 'arrOfxGawang"
  "dbd9af7d26d3b4c7d9623e5d36caf99c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arrOfxGawang>)))
  "Returns full string definition for message of type '<arrOfxGawang>"
  (cl:format cl:nil "int32[] xComponent~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arrOfxGawang)))
  "Returns full string definition for message of type 'arrOfxGawang"
  (cl:format cl:nil "int32[] xComponent~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arrOfxGawang>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'xComponent) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arrOfxGawang>))
  "Converts a ROS message object to a list"
  (cl:list 'arrOfxGawang
    (cl:cons ':xComponent (xComponent msg))
))
