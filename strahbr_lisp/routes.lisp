(in-package #:ZAIdmanBROKER.ru)

;; 404

(defun page-404 (&optional (title "404 Not Found") (content "Страница не найдена"))
  (let* ((title "404 Not Found")
         (menu-memo (menu)))
    (restas:render-object
     (make-instance 'ZAIdmanBROKER-render)
     (list title
           menu-memo
           (tpl:default
               (list :title title
                     :navpoints menu-memo
                     :content "Страница не найдена"))))))

(restas:define-route not-found-route ("*any")
  (restas:abort-route-handler
   (page-404)
   :return-code hunchentoot:+http-not-found+
   :content-type "text/html"))



;; main

(restas:define-route main ("/")
  (let* ((lines (iter (for line in-file (path "aforizm.txt") using #'read-line)
                     (collect line)))
         (line (nth (random (length lines))
                    lines)))
    (list "Первое правило после покупки ТС - ZAIdmanBROKER.ru"
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

(def/route whozaidman ("whozaidman" :method :post)
  (path "content/whozaidman.html"))

(def/route strbr_for_you ("strbr_for_you")
  (path "content/strbr_for_you.html"))

(def/route strahkons ("strahkons")
  (path "content/strahkons.html"))

 (def/route regulations ("regulations")
  (path "content/regulations.html"))

 (def/route service ("service")
 (path "content/service.html"))

(def/route osago ("osago")
  (path "content/osago.html"))

(def/route kasko ("kasko")
  (path "content/kasko.html"))

(def/route apparat ("apparat")
  (path "content/apparat.html"))

(def/route garmoshka ("garmoshka")
  (path "content/garmoshka.html"))

(def/route contacts ("contacts")
 (path "content/contacts.html"))

(def/route useful_links ("useful_links")
  (path "content/useful_links.html"))

(def/route article ("article")
  (path "content/article.html"))



;; submodules

(restas:mount-submodule -css- (#:restas.directory-publisher)
                        (restas.directory-publisher:*baseurl* '("css"))
                        (restas.directory-publisher:*directory* (path "css/")))

(restas:mount-submodule -img- (#:restas.directory-publisher)
                        (restas.directory-publisher:*baseurl* '("img"))
                        (restas.directory-publisher:*directory* (path "img/")))

