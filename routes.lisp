(in-package #:zaidmanbroker)


;; 404

(defun page-404 (&optional (title "404 Not Found") (content "Страница не найдена"))
  (let* ((title "404 Not Found")
         (menu-memo (menu)))
    (restas:render-object
     (make-instance 'rigidus-render)
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
  (let* ((lines (iter (for line in-file (path "news.txt") using #'read-line)
                     (collect line)))
         (line (nth (random (length lines))
                    lines)))
    (list "Первое правило после покупки..."
          (menu)
          (tpl:main (list :title line
                          :links (get-sape-links "/"))))))


;; plan file pages

(restas:define-route about ("about")
  (path "content/about.org"))
(restas:define-route about/ ("about/")
  (path "content/about.org"))

(restas:define-route resources ("resources")
  (path "content/resources.org"))
(restas:define-route resources/ ("resources/")
  (path "content/resources.org"))

(restas:define-route faq ("faq")
  (path "content/faq.org"))
(restas:define-route faq/ ("faq/")
  (path "content/faq.org"))

(restas:define-route contacts ("contacts")
  (path "content/contacts.org"))
(restas:define-route contacts/ ("contacts/")
  (path "content/contacts.org"))


;; showing news

(defun show-new-from-hash (strkey hash)
  (multiple-value-bind (article isset)
      (gethash strkey hash)
    (if isset
        article
        (restas:abort-route-handler
         (page-404)
         :return-code hunchentoot:+http-not-found+
         :content-type "text/html"))))


(restas:define-route news ("news") /NEWS/
  *cached-news-page*)
(restas:define-route news/ ("news/")
  *cached-news-page*)

(restas:define-route new ("news/:strkey")
  (show-new-from-hash strkey *news*))
(restas:define-route new/ ("news/:strkey/")
  (show-new-from-hash strkey *news*))


(restas:define-route aliens ("aliens") /Дополнительные материалы/
  *cached-alien-page*)
(restas:define-route aliens/ ("aliens/")
  *cached-alien-page*)

(restas:define-route alien ("alien/:strkey")
  (show-article-from-hash strkey *aliens*))
(restas:define-route alien/ ("alien/:strkey/")
  (show-article-from-hash strkey *aliens*))


;; submodules

(restas:mount-submodule -css- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("css"))
  (restas.directory-publisher:*directory* (path "css/")))

(restas:mount-submodule -img- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("img"))
  (restas.directory-publisher:*directory* (path "img/")))

(restas:mount-submodule -resources- (#:restas.directory-publisher)
  (restas.directory-publisher:*baseurl* '("resources"))
  (restas.directory-publisher:*directory* (path "resources/")))
