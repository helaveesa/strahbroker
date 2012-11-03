(in-package #:strahbroker)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; default-render
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass strahbroker-render () ())

(defparameter *default-render-method* (make-instance 'strahbroker-render))


;; (defmethod restas:render-object ((designer strahbroker-render) (data list))
;;   (destructuring-bind (headtitle navpoints content) data
;;     (tpl:root (list :headtitle headtitle
;;                     :content (tpl:base (list :navpoints navpoints
;;                                              :content content
;;                                              :stat (tpl:stat)))))))
