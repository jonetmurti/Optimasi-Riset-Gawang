; Auto-generated. Do not edit!


(cl:in-package daho_vision-msg)


;//! \htmlinclude xGawang.msg.html

(cl:defclass <xGawang> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0))
)

(cl:defclass xGawang (<xGawang>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <xGawang>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'xGawang)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name daho_vision-msg:<xGawang> is deprecated: use daho_vision-msg:xGawang instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <xGawang>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-msg:x-val is deprecated.  Use daho_vision-msg:x instead.")
  (x m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <xGawang>) ostream)
  "Serializes a message object of type '<xGawang>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <xGawang>) istream)
  "Deserializes a message object of type '<xGawang>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<xGawang>)))
  "Returns string type for a message object of type '<xGawang>"
  "daho_vision/xGawang")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'xGawang)))
  "Returns string type for a message object of type 'xGawang"
  "daho_vision/xGawang")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<xGawang>)))
  "Returns md5sum for a message object of type '<xGawang>"
  "b429044e1360891965aa67e074722c0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'xGawang)))
  "Returns md5sum for a message object of type 'xGawang"
  "b429044e1360891965aa67e074722c0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<xGawang>)))
  "Returns full string definition for message of type '<xGawang>"
  (cl:format cl:nil "int64 x~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'xGawang)))
  "Returns full string definition for message of type 'xGawang"
  (cl:format cl:nil "int64 x~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <xGawang>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <xGawang>))
  "Converts a ROS message object to a list"
  (cl:list 'xGawang
    (cl:cons ':x (x msg))
))
