;;;; clc.asd

(asdf:defsystem #:clcu
  :description "Common Lisp Common Utilities"
  :author "Jay Morgan <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname "src/"
  :components ((:file "../package")
               (:file "clcu")))

(asdf:defsystem #:clcu/tests
  :depends-on ("clcu" "fiveam")
  :pathname "tests"
  :components ((:file "test")))
