;; create a 2D array- all nil, then run functions 
;; Erica Ho
;; to run this program type in sbcl --load funcs.lisp
(format t "~%~%Hello, what is your name? ~%")
(defvar *name* (read))
(format t "Hello ~a! ~%" *name*)

(setq *print-case* :downcase); all printed stuff will be lower case



