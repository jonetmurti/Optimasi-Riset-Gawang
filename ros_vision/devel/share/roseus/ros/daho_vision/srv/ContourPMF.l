;; Auto-generated. Do not edit!


(when (boundp 'daho_vision::ContourPMF)
  (if (not (find-package "DAHO_VISION"))
    (make-package "DAHO_VISION"))
  (shadow 'ContourPMF (find-package "DAHO_VISION")))
(unless (find-package "DAHO_VISION::CONTOURPMF")
  (make-package "DAHO_VISION::CONTOURPMF"))
(unless (find-package "DAHO_VISION::CONTOURPMFREQUEST")
  (make-package "DAHO_VISION::CONTOURPMFREQUEST"))
(unless (find-package "DAHO_VISION::CONTOURPMFRESPONSE")
  (make-package "DAHO_VISION::CONTOURPMFRESPONSE"))

(in-package "ROS")





(defclass daho_vision::ContourPMFRequest
  :super ros::object
  :slots (_idx ))

(defmethod daho_vision::ContourPMFRequest
  (:init
   (&key
    ((:idx __idx) 0)
    )
   (send-super :init)
   (setq _idx (round __idx))
   self)
  (:idx
   (&optional __idx)
   (if __idx (setq _idx __idx)) _idx)
  (:serialization-length
   ()
   (+
    ;; int64 _idx
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _idx
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _idx (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _idx) (= (length (_idx . bv)) 2)) ;; bignum
              (write-long (ash (elt (_idx . bv) 0) 0) s)
              (write-long (ash (elt (_idx . bv) 1) -1) s))
             ((and (class _idx) (= (length (_idx . bv)) 1)) ;; big1
              (write-long (elt (_idx . bv) 0) s)
              (write-long (if (>= _idx 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _idx s)(write-long (if (>= _idx 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _idx
#+(or :alpha :irix6 :x86_64)
      (setf _idx (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _idx (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass daho_vision::ContourPMFResponse
  :super ros::object
  :slots (_ratio ))

(defmethod daho_vision::ContourPMFResponse
  (:init
   (&key
    ((:ratio __ratio) 0.0)
    )
   (send-super :init)
   (setq _ratio (float __ratio))
   self)
  (:ratio
   (&optional __ratio)
   (if __ratio (setq _ratio __ratio)) _ratio)
  (:serialization-length
   ()
   (+
    ;; float64 _ratio
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _ratio
       (sys::poke _ratio (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _ratio
     (setq _ratio (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass daho_vision::ContourPMF
  :super ros::object
  :slots ())

(setf (get daho_vision::ContourPMF :md5sum-) "4bb5d9f5e6e30948bd500fd3fb78b38b")
(setf (get daho_vision::ContourPMF :datatype-) "daho_vision/ContourPMF")
(setf (get daho_vision::ContourPMF :request) daho_vision::ContourPMFRequest)
(setf (get daho_vision::ContourPMF :response) daho_vision::ContourPMFResponse)

(defmethod daho_vision::ContourPMFRequest
  (:response () (instance daho_vision::ContourPMFResponse :init)))

(setf (get daho_vision::ContourPMFRequest :md5sum-) "4bb5d9f5e6e30948bd500fd3fb78b38b")
(setf (get daho_vision::ContourPMFRequest :datatype-) "daho_vision/ContourPMFRequest")
(setf (get daho_vision::ContourPMFRequest :definition-)
      "int64 idx
---
float64 ratio
")

(setf (get daho_vision::ContourPMFResponse :md5sum-) "4bb5d9f5e6e30948bd500fd3fb78b38b")
(setf (get daho_vision::ContourPMFResponse :datatype-) "daho_vision/ContourPMFResponse")
(setf (get daho_vision::ContourPMFResponse :definition-)
      "int64 idx
---
float64 ratio
")



(provide :daho_vision/ContourPMF "4bb5d9f5e6e30948bd500fd3fb78b38b")


