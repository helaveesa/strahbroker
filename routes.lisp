(in-package #:strahbroker)

;; 404

(defun page-404 (&optional (title "404 Not Found") (content "Страница не найдена"))
"404:  извините,страница, которую Вы запросили, не находится в нашей базе данных. Скорее всего вы попали на битую ссылку или опечат\
ались при вводе URL")

(restas:define-route not-found-route ("*any")
    (restas:abort-route-handler
        (page-404)
           :return-code hunchentoot:+http-not-found+
              :content-type "text/html"))


(defun old-page (filename)
    (tpl:root
        (list :content
              (list :content (alexandria:read-file-into-string filename))))))


;; main

(restas:define-route main ("/")
    (tpl:root
        (list :content (concatenate 'string))))
                                     ;;(tpl:platform)
                                     ;;(tpl:ecosystem)
                                     ;;(tpl:amc)
                                     ;;(tpl:solutions)
                                     ;;(tpl:thrive)
                                     ;;(tpl:app))))))


;; plan file pages

(defmacro def/route (name param &body body)
    `(progn
        (restas:define-route ,name ,param
          ,@body)
        (restas:define-route
             ,(intern (concatenate 'string (symbol-name name) "/"))
             ,(cons (concatenate 'string (car param) "/") (cdr param))
           ,@body)))

(def/route about ("about")
    (old-page "content/about.htm"))

(def/route about2 ("clients")
    (old-page "content/clients.htm"))

(def/route about3 ("biografy")
  (old-page "content/biografy.htm"))

(def/route about4 ("work")
  (old-page "content/work.htm"))

(def/route article ("article")
  (old-page "content/article.htm"))

(def/route service ("service")
  (old-page "content/service.htm"))

(def/route service2 ("kasko")
  (old-page "content/kasko.htm"))

(def/route service3 ("osago")
  (old-page "content/osago.htm"))

(def/route service4 ("regulations")
  (old-page "content/regulations.htm"))

(def/route apparat ("apparat")
  (old-page "content/apparat.htm"))

(def/route contacts ("contacts")
  (old-page "content/contacts.htm"))


;; submodules

(restas:mount-submodule -css- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("css"))
  (restas.directory-publisher:*directory* (path "css/")))

(restas:mount-submodule -js- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("js"))
  (restas.directory-publisher:*directory* (path "js/")))

(restas:mount-submodule -img- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("img"))
  (restas.directory-publisher:*directory* (path "img/")))

(restas:mount-submodule -resources- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("resources"))
  (restas.directory-publisher:*directory* (path "resources/")))



