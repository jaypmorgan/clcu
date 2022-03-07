(in-package :clcu/tests)

(def-suite pipe :description "Suite to test the pipe function (->)")
(in-suite pipe)

(test ->1
  (is (= 7 (clcu:-> 2 (lambda (n) (+ n 3)) (lambda (n) (+ n 2))))))

(test ->2
  (is (= 2 (clcu:-> 2))))

(test ->3
  (is (null (clcu:->))))

(def-suite string-split :description "Suite to test the string split function (string-split)")
(in-suite string-split)

(test split-string-1
  (let ((s "this,is,a,string"))
    (is (reduce (lambda (p n) (if (not n) n p))
		(mapcar (lambda (x y) (string= x y))
			(clcu:string-split s ",")
			'("this" "is" "a" "string"))))))
