;;;; clcu.lisp

(in-package #:clcu)

(defun -> (&rest body)
  "Pipe the results to the next argument"
  (reduce (lambda (prev next) (funcall (eval next) prev))
	  (cdr body)
	  :initial-value (eval (car body))))

(defun compose (&rest funs)
  "Compose many functions into a single function"
  (lambda (in) (apply #'-> in funs)))

(defun string-split (str &optional (delim " "))
  "Split a string into a sequence, splitting on a delimiter."
  (labels ((f (s r)
	     (let ((pos (search delim s)))
	       (cond ((not (eq nil pos)) (f (subseq s (1+ pos)) (cons (subseq s 0 pos) r)))
		     ((string= s "") (nreverse r))
		     (t (nreverse (cons s r)))))))
    (f str nil)))
