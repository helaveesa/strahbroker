(asdf:defsystem #:zaidmanbroker
  :version "..."
  :author "rigidus <i.am.rigidus@gmail.com>"
	  "helaveesa <helaveesa.nolder@gmail.com>"
  :licence "..."
  :description "site http://zaidmanbroker.ru"
  :depends-on (#:...
                 #:restas-directory-publisher
                 #:closure-template)
  :serial ...
  :components ((:static-file "templates.htm")
                 (:file "defmodule")
                 (:file "orgmode")
                 (:file "sape")
                 (:file "render")
                 (:file "routes")
                 (:file "init")
                 (:static-file "daemon.conf")
                 (:static-file "daemon.lisp")
                 (:static-file "daemon.sh")))
