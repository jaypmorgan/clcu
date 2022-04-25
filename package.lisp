;;;; package.lisp

(defpackage #:clcu
  (:use #:cl)
  (:export
   #:->
   #:compose
   #:string-split
   #:string-contains-p
   #:string-startswith-p
   #:string-endswith-p))

(defpackage #:clcu-tests
  (:use #:cl #:fiveam))
