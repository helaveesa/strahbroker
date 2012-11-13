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
        ;;(list :content
              (list :content (alexandria:read-file-into-string filename))))


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

(def/route articles ("articles")
  (old-page "content/articles.htm"))

(def/route contacts ("contacts")
  (old-page "content/contacts.htm"))

(def/route imagescar ("imagescar")
  (old-page "content/imagescar.htm"))

(def/route kasko ("kasko")
  (old-page "content/kasko.htm"))

(def/route osago ("osago")
  (old-page "content/osago.htm"))

(def/route regulations ("regulations")
  (old-page "content/regulations.htm"))

(def/route sitemap ("sitemap")
  (old-page "content/sitemap.htm"))

(def/route strahkomp ("strahkomp")
  (old-page "content/strahkomp.htm"))

(def/route ulinks ("ulinks")
  (old-page "content/ulinks.htm"))



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

(restas:mount-submodule -gif- (#:restas.directory-publisher)
    (restas.directory-publisher:*baseurl* '("gif"))
      (restas.directory-publisher:*directory* (path "gif/")))



