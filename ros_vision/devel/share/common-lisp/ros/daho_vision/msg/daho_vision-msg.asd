
(cl:in-package :asdf)

(defsystem "daho_vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PosisiBola" :depends-on ("_package_PosisiBola"))
    (:file "_package_PosisiBola" :depends-on ("_package"))
    (:file "arrOfxGawang" :depends-on ("_package_arrOfxGawang"))
    (:file "_package_arrOfxGawang" :depends-on ("_package"))
    (:file "xGawang" :depends-on ("_package_xGawang"))
    (:file "_package_xGawang" :depends-on ("_package"))
  ))