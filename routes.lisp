(in-package #:strahbroker)

;; main

(restas:define-route main ("/")
  (let* ((lines (iter (for line in-file (path "aforizm.txt") using #'read-line)
                     (collect line)))
         (line (nth (random (length lines))
                    lines)))
    (list "ZaidmanBroker.ru"
          (menu)
          (tpl:main (list :title line
                          :links (get-sape-links "/"))))))


;; plan file pages

 (defmacro def/route (name param &body body)
 `(progn
  (restas:define-route ,name ,param
    ,@body)
  (restas:define-route
    ,(intern (concatenate 'string (symbol-name name) "/"))
    ,(cons (concatenate 'string (car param) "/") (cdr param))
    ,@body)))


 (def/route regulations ("regulations" :method :post)
  (path "content/regulations.html"))

 (def/route service ("service")
 (path "content/service.html"))

(def/route contacts ("contacts")
 (path "content/contacts.html"))


