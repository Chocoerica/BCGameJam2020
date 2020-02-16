;; create a 2D array- all nil, then run functions 
;; Erica Ho
;; to run this program type in sbcl --load funcs.lisp
(format t "~%~%Hello, what is your name? ~%")
(defvar *name* (read))
(format t "Hello ~a! ~%" *name*)

(setq *print-case* :downcase); all printed stuff will be lower case

(defvar *word-dictionary* '(Super Good Hello Bear Given 
				Regret Crocs Apple Heart Love
				Wolf Group Monkeys Challenge Stress
				Overcome Prove Reign Succeed Winner
				Truimph Victorious Obstacle Beaten Rules
				Oranges Feel World Glory Guts 
				Friend Everyone Prevail Pack Compassion
				WhyLisp Empathy Suffering Concern World ) )
#||
function that returns 1 word at a time, and its index

||#


(defun choose-words (dictionary currlist &optional num-words) ;;given a list of 40 words, returns a list of num-words words
	(format t "running choose-words~%"); test
	(dolist (word dictionary)
		(format t "~a, " word)
	);test list is passed through
	(defvar word-list nil )
	(if (eq num-words nil)
	  	(setf num-words 3)
	); if num-words is not inputted into the parameter, then it is automatically 3
	;; using loop do get random indexes - assume dictionary has 40 words
	;;(defvar randnum 0)
	(defvar w nil)
	(loop for x from 0 to (- num-words 1)
	do(progn
	      (format t "hi~%")
	      (let randnum (- (random 39) x)) ; sets number to be from 0 to 39-x (0 to 39 first)
	      ;;get word using index, then remove it from local list
	      ;;(setf w (nth randnum dictionary ))
	      ;;(nconc (subseq dictionary 0 randnum) (nthcdr (1+randnum) dictionary) )
	      ;;(push w word-list)
	      ;;(dolist (ww dictionary) (format t "~a " ww)) ; test print
	      ;)
	))
)
(choose-words *word-dictionary*)


