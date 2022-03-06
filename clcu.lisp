;;;; clc.lisp

(in-package #:clcu)

(defun -> (&rest body)
  "Pipe the results to the next argument"
  (reduce (lambda (prev next) (funcall (eval next) prev))
	  (cdr body)
	  :initial-value (eval (car body))))

(defun compose (&rest funs)
  "Compose many functions into a single function"
  (lambda (in) (apply #'-> in funs)))
