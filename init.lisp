(in-package #:strahbroker)

(defun menu ()
  '((:link "/" :title "Главная")
    (:link "/about" :title "Страхование")
    (:link "/article" :title "Статьи")
    (:link "/service" :title "Услуги")
    (:link "/contacts" :title "Контакты")))

;; start
(restas:start '#:strahbroker :port 2001)
(restas:debug-mode-on)
;; (restas:debug-mode-off)
(setf hunchentoot:*catch-errors-p* t)
