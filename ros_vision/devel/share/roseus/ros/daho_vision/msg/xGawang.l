;; Auto-generated. Do not edit!


(when (boundp 'daho_vision::xGawang)
  (if (not (find-package "DAHO_VISION"))
    (make-package "DAHO_VISION"))
  (shadow 'xGawang (find-package "DAHO_VISION")))
(unless (find-package "DAHO_VISION::XGAWANG")
  (make-package "DAHO_VISION::XGAWANG"))

(in-package "ROS")
;;//! \htmlinclude xGawang.msg.html


(defclass daho_vision::xGawang
  :super ros::object
  :slots (_x ))

(defmethod daho_vision::xGawang
  (:init
   (&key
    ((:x __x) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:serialization-length
   ()
   (+
    ;; int64 _x
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get daho_vision::xGawang :md5sum-) "b429044e1360891965aa67e074722c0e")
(setf (get daho_vision::xGawang :datatype-) "daho_vision/xGawang")
(setf (get daho_vision::xGawang :definition-)
      "int64 x
")



(provide :daho_vision/xGawang "b429044e1360891965aa67e074722c0e")


