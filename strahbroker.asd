(require 'swank)

(asdf:defsystem #:strahbroker
      :version      "0.0.2"
      :author       "helaveesa <helaveesa.nolder@gmail.com>"
      :licence      "GPLv3"
      :description  "site http://rigidus.ru"
      :depends-on   (#:closer-mop
                     #:cl-ppcre
                     #:restas-directory-publisher
                     #:closure-template
                     #:cl-json
                     #:postmodern)
      :serial       t
      :components   ((:static-file "templates.htm")
                     (:file "defmodule")
                     (:file "render")
                     (:file "routes")
                     (:file "init")))
