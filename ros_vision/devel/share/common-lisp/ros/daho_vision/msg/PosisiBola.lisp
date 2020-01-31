; Auto-generated. Do not edit!


(cl:in-package daho_vision-msg)


;//! \htmlinclude PosisiBola.msg.html

(cl:defclass <PosisiBola> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass PosisiBola (<PosisiBola>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PosisiBola>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PosisiBola)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name daho_vision-msg:<PosisiBola> is deprecated: use daho_vision-msg:PosisiBola instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PosisiBola>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-msg:x-val is deprecated.  Use daho_vision-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PosisiBola>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader daho_vision-msg:y-val is deprecated.  Use daho_vision-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PosisiBola>) ostream)
  "Serializes a message object of type '<PosisiBola>"
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
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PosisiBola>) istream)
  "Deserializes a message object of type '<PosisiBola>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PosisiBola>)))
  "Returns string type for a message object of type '<PosisiBola>"
  "daho_vision/PosisiBola")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PosisiBola)))
  "Returns string type for a message object of type 'PosisiBola"
  "daho_vision/PosisiBola")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PosisiBola>)))
  "Returns md5sum for a message object of type '<PosisiBola>"
  "3b834ede922a0fff22c43585c533b49f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PosisiBola)))
  "Returns md5sum for a message object of type 'PosisiBola"
  "3b834ede922a0fff22c43585c533b49f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PosisiBola>)))
  "Returns full string definition for message of type '<PosisiBola>"
  (cl:format cl:nil "int64 x~%int64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PosisiBola)))
  "Returns full string definition for message of type 'PosisiBola"
  (cl:format cl:nil "int64 x~%int64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PosisiBola>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PosisiBola>))
  "Converts a ROS message object to a list"
  (cl:list 'PosisiBola
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
