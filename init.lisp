(in-package #:strahbroker)

(defun menu ()
  '((:link "/" :title "Главная")
    (:link "/about/" :title "Страховой-консультант")
    (:link "/yz/" :title "Яков-Зайдман")
    (:link "/articles/" :title "Статьи")
    (:link "/ulinks/" :title "Полезные-ссылки")
    (:link "/contacts/" :title "Контакты")
    (:link "/imgcar/" :title "Водителям")))

;; start
(restas:start '#:strahbroker :port 2001)
(restas:debug-mode-on)
;; (restas:debug-mode-off)
(setf hunchentoot:*catch-errors-p* t)
