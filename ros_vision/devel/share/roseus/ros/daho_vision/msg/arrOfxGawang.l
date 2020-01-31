;; Auto-generated. Do not edit!


(when (boundp 'daho_vision::arrOfxGawang)
  (if (not (find-package "DAHO_VISION"))
    (make-package "DAHO_VISION"))
  (shadow 'arrOfxGawang (find-package "DAHO_VISION")))
(unless (find-package "DAHO_VISION::ARROFXGAWANG")
  (make-package "DAHO_VISION::ARROFXGAWANG"))

(in-package "ROS")
;;//! \htmlinclude arrOfxGawang.msg.html


(defclass daho_vision::arrOfxGawang
  :super ros::object
  :slots (_xComponent ))

(defmethod daho_vision::arrOfxGawang
  (:init
   (&key
    ((:xComponent __xComponent) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _xComponent __xComponent)
   self)
  (:xComponent
   (&optional __xComponent)
   (if __xComponent (setq _xComponent __xComponent)) _xComponent)
  (:serialization-length
   ()
   (+
    ;; int32[] _xComponent
    (* 4    (length _xComponent)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _xComponent
     (write-long (length _xComponent) s)
     (dotimes (i (length _xComponent))
       (write-long (elt _xComponent i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _xComponent
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xComponent (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _xComponent i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get daho_vision::arrOfxGawang :md5sum-) "dbd9af7d26d3b4c7d9623e5d36caf99c")
(setf (get daho_vision::arrOfxGawang :datatype-) "daho_vision/arrOfxGawang")
(setf (get daho_vision::arrOfxGawang :definition-)
      "int32[] xComponent
")



(provide :daho_vision/arrOfxGawang "dbd9af7d26d3b4c7d9623e5d36caf99c")


