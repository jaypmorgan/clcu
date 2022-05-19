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
  "Split a string into a sequence, splitting on a delimiter.

> (string-split \"this is a string\")
(\"this\" \"is\" \"a\" \"string\")

The second argument is the delimiter character (string) to split the
string by. By default this function splits by spaces.

> (string-split \"this,is,another,string\" \",\")
(\"this\" \"is\" \"another\" \"string\")
"
  (labels ((f (s r)
	     (let ((pos (search delim s)))
	       (cond ((not (eq nil pos)) (f (subseq s (1+ pos)) (cons (subseq s 0 pos) r)))
		     ((string= s "") (nreverse r))
		     (t (nreverse (cons s r)))))))
    (f str nil)))

(defun string-contains-p (str substr)
  "Does STR contain SUBSTR"
  (search substr str))

(defun string-startswith-p (str startswith)
  (str:starts-with-p startswith str))

(defun string-endswith-p (str endswith)
  (str:ends-with-p endswith str))

(defun string-join (lst &optional (delim " "))
  (str:join delim lst))
