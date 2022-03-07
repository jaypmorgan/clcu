;;;; package.lisp

(defpackage #:clcu
  (:use #:cl)
  (:export #:-> #:compose #:string-split))

(defpackage #:clcu/tests
  (:use #:cl #:fiveam))
