
(cl:in-package :asdf)

(defsystem "daho_vision-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ContourPMF" :depends-on ("_package_ContourPMF"))
    (:file "_package_ContourPMF" :depends-on ("_package"))
  ))