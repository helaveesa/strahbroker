(in-package #:strahbroker)

(defun menu ()
  '((:link "/" :title "Главная")
    (:link "/aaa" :title "aaa")
        (:link "/aaa_aaa" :title "a-aaa")
        (:link "/aaa_aaa" :title "a-aaa")




;; start
(restas:start '#:strahbroker :port )
(restas:debug-mode-on)
;; (restas:debug-mode-off)
(setf hunchentoot:*catch-errors-p* t)
