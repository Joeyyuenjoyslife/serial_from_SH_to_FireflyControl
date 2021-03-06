;; Auto-generated. Do not edit!


(when (boundp 'serial_cmd::serial)
  (if (not (find-package "SERIAL_CMD"))
    (make-package "SERIAL_CMD"))
  (shadow 'serial (find-package "SERIAL_CMD")))
(unless (find-package "SERIAL_CMD::SERIAL")
  (make-package "SERIAL_CMD::SERIAL"))

(in-package "ROS")
;;//! \htmlinclude serial.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass serial_cmd::serial
  :super ros::object
  :slots (_header _cmd ))

(defmethod serial_cmd::serial
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cmd __cmd) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _cmd (round __cmd))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _cmd
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _cmd
       (write-byte _cmd s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _cmd
     (setq _cmd (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cmd 127) (setq _cmd (- _cmd 256)))
   ;;
   self)
  )

(setf (get serial_cmd::serial :md5sum-) "96d69b5d7ec20ad2ea96e00e9cdf8c75")
(setf (get serial_cmd::serial :datatype-) "serial_cmd/serial")
(setf (get serial_cmd::serial :definition-)
      "Header header
int8   cmd

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :serial_cmd/serial "96d69b5d7ec20ad2ea96e00e9cdf8c75")


