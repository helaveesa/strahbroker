(in-package #:zaidmanbroker)

(defun menu ()
  (list (list :link "/" :title "Главная")
        (list :link "/about" :title "About")
        (list :link "/articles/" :title "News")
        (list :link "/aliens/" :title "Дополнительные материалы")
        (list :link "/resources/" :title "Ресурсы")
        (list :link "/faq/" :title "FAQ")
        (list :link "/contacts" :title "Контакты")))


;; cache-section /Кэш-раздел/
(defun cache-section (global-var-hash relative-filepath) 
/(определение функции кэш-раздела (глобального VAR-хэш относительный путь файла)/

  (loop :for file :in (directory (path (format nil "~A*.*" relative-filepath))) :do 
/(цикл: для файлов: в каталоге ((путь (формат ноль "~ * *". относительный путь файла))): сделать/

     (setf (gethash (pathname-name file) global-var-hash)
/(SETF (GetHash (путь, имя файла) глобального VAR-хэш)/

           (parse-org file))))
/(разбор-орг файл))))/


;; cache-page /Кэш-страницы/
(defun cache-page (relative-filepath global-var-hash subst)
/(определение функции кэш-страницы (относительный путь файла глобального VAR-хэш SUBST)/

  (let ((data (parse-org (path relative-filepath))))
/(let ((данных (разбор-орг (путь относительный путь файла))))/

    (setf (orgdata-content data)
/(SETF (orgdata содержание данных)/

          (ppcre:regex-replace-all
           "@make-list-by-category(.*)@" 
/(ppcre: регулярные выражения, заменяющие
            "@ make-списка по категории (. *) @" - эта строчка ищет определенные строки в файле; .* - значит любое кол-во любых символов/

           (orgdata-content data)
/(orgdata содержание данных)/

           (list #'(lambda (match reg) /(Список # '(лямбда (матч reg)/

                     (declare (ignore match)) /(declare (игнорировать матч))/

                     (let* ((instr (string-trim '(#\Space #\Tab #\Newline) reg))) 
	/(пусть * ((InStr (строка-профиль (# \ Space # \ # Tab \ строки) reg)))

                       (multiple-value-bind (star color category) /(несколько значений привязку (star цвет категория)/

                           (values-list (split-sequence:split-sequence #\Space instr))
	/(значения-лист (сплит-последовательности: сплит-последовательности # \ Space Instr))/

                         (format nil /формат ноль/
                                 "<ul>~{~a~}</ul>" /значение/

                                 (iter (for x in (sort (find-articles-by-category category global-var-hash subst)
                                                       #'string<
                                                       :key #'(lambda (x) (getf x :sort))))
                                       (collect (tpl:li (append x (list :star star :color color))))))))))
           :simple-calls t))
    data))

(defun load-org () /(определение функции нагрузки орг ()/
  ;; *articles* *aliens* *asdf*
  (cache-section *articles* "content/articles/")
  (cache-section *aliens* "content/aliens/")
  ;; cached pages
  (setf *cached-articles-page* (cache-page "content/articles.org" *articles* "/articles/"))
  (setf *cached-alien-page* (cache-page "content/alien.org" *aliens* "/alien/")))


(load-org)

(orgdata-directives (gethash "asdf-foreword" *aliens*))
(orgdata-directives (gethash "asdf-architecture" *aliens*))

;; start
(restas:start '#:zaidmanbroker #|:hostname "zaidmanbroker.ru"|# :port ...)
(restas:debug-mode-on)
;; (restas:debug-mode-off)
(setf hunchentoot:*catch-errors-p* ...)
