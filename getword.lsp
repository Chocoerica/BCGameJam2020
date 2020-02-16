; 3 2 1
;  \|/
;4--+--0
;  /|\
; 5 6 7


(setq *print-case* :downcase) ; all printed stuff will be lower case
(setf *random-state* (make-random-state t)) ; set randomness


(defvar *word-dictionary* (list "Super" "Good" "Hello" "Bear" "Given" 
							"Regret" "Crocs" "Apple" "Heart" "Love"     
							"Wolf" "Group" "Monkeys" "Challenge" "Stress"
							"Overcome" "Prove" "Reign" "Succeed" "Winner"  
							"Truimph" "Victorious" "Obstacle" "Beaten" "Rules" 
							"Oranges" "Feel" "Someone" "Glory" "Guts" "Circle"      
							"Friend" "Everyone" "Prevail" "Pack" "Compassion" 
							"WhyLisp" "Empathy" "Suffering" "Concern" "World" ) )
#||  
What this file does:
	- function that takes list of words from dictionary
	- see if word fits
	- if it fits, then remove word from temp-dictionary
||# 

(defvar size 10)

(defvar count2 0)

(defvar test (make-array (list size size)))

(defun check-word-fit(wordString);check-word-fit given word to fit in, etc. CHECK MITCH CODE
;; if word fits, put it in grid
;; returns bool of if it was successful or not
	(format t "count is ~a ~%" count2)
	;(defvar wordString "This")
;	(print "Count =")
;	(print count)
	;(defvar direction (random 8))
	(setf direction (random 7))
	
	(print wordString)
	(setf x (random size))	
	(setf y (random size))	
	(defvar wordLength (length wordString))
	
	(format t "x-coord(y) = ~A~%" y)
	(format t "y-coord(x) = ~A~%" x)
	(format t "direction = ~A~%" direction)
	;(write (make-array (list size size) :initial-element '0))
	;(setf (aref make-array 2 4) "1")
	;(terpri)

	

	(if (> count2 10)
		(return-from check-word-fit)	
	)
	
	
	(if (or (or (eq direction 2) (eq direction 1)) (eq direction 3)) ;UP
		(progn
			(format t "direction = ~A~%" direction)
			(format t "x end is ~d~%" (- x wordLength))
			(if(> -1 (- x wordLength))
				(progn
					(print "This is bad 1") 
					(setf count2 (+ count2 1))
					(check-word-fit wordString)
					(return-from check-word-fit)
				)
			)
		)
	)
	
	(if (or (or (eq direction 5) (eq direction 4)) (eq direction 3)) ;left
		(progn
			(format t "direction = ~A~%" direction)
			(format t "y end is ~d~%" (- y wordLength))
			(if(> -1 (- y wordLength))
				(progn
					(print "This is bad 2")
					(setf count2 (+ count2 1))
					(check-word-fit wordString)
					(return-from check-word-fit)
				)
			)
		)
	)

	(if (or (or (eq direction 5) (eq direction 6)) (eq direction 7)) ;down
		(progn
			(format t "direction = ~A~%" direction)
			(format t "x2 end is ~d~%" (+ x wordLength))
			(if(< size (+ x wordLength))
				(progn
					(print "This is bad 3")
					(setf count2 (+ count2 1))
					(check-word-fit wordString)
					(return-from check-word-fit)
				)
			)
		)
	)

	(if (or (or (eq direction 7) (eq direction 0)) (eq direction 1)) ;right
		(progn
			(format t "direction = ~A~%" direction)
			(format t "y2 end is ~d~%" (+ y wordLength))
			(if(< size (+ y wordLength))
				(progn
					(print "This is bad 4")
					(setf count2 (+ count2 1))
					(check-word-fit wordString)
					(return-from check-word-fit)
				)
			)
		)
	)


	(print "there")
	(loop for c across wordString
		do (progn
;			(print direction)
;			(print c)
;			(print x)
;			(print y)
			(setf (aref test x y) c)
;			(print "here")
	(if (or (or (eq direction 2) (eq direction 1)) (eq direction 3)) ;UP
		(progn
;		(print "if one")
			(setf x (- x 1))
		)
	)

	(if (or (or (eq direction 5) (eq direction 4)) (eq direction 3)) ;left
		(progn
;		(print "if two")
		(setf y (- y 1))
		)
	)

	(if (or (or (eq direction 5) (eq direction 6)) (eq direction 7)) ;down	
		(progn
;		(print "If three")
			(setf x (+ x 1))
		)
	)

	(if (or (or (eq direction 7) (eq direction 0)) (eq direction 1)) ;right
		(progn
;		(print "if four")
			(setf y (+ y 1))
		)
	)
	)
	)

	(write test)
	;(setq ((wordLength)(length wordString))

	;(print wordLength)
	;(print direction)
	;(print x)
	;(print y)
	(return-from check-word-fit (< 1 10))
)

;;----------------------------

(defun remove-word (index list)
	(if (zerop index)(cdr list) 
		(cons (car list) (remove-word (1- index) (cdr list)))
	)
)

(defun choose-words (dictionary &optional num-words) 
	;;given a list of 40 words, returns a list of num-words words
	;; calls on check-word-fit for every word to see if it fits
	;; uses remove-word
	;; assume that num-words number of words will fit before run out of words in dictionary
	
	
	(defvar word-list (list))
	(dolist (ww word-list) (format t "~a " ww)) ; test print
	(format t "~%") ; test print
	(if (eq num-words nil)
		(setf num-words 10)
	); if num-words is not inputted into the parameter, then it is automatically 10
	;; using loop do get random indexes - assume dictionary has 40 words
	(let ((rand-num 0)))
	(loop for x from 0 to (min (- num-words 1) 39)
	do(progn
		(format t "hi from choose-words~%")
		(setq rand-num (random (- 41 x))) ; sets number to be from 0 to 39-x (0 to 39 first)
		;;(format t "~a and rand num is ~a ~%" x rand-num)
		
		;; need to add test if fit function SEE MITCH's CODE 
		(setf count 0)
		(if (check-word-fit (nth rand-num dictionary) ) ;; LATER SEE MITCH'S CODE
			(push (nth rand-num dictionary) word-list) ; put in word-list
		)  
		
		;;get word using index, then remove it from local list
		(setq dictionary (remove-word rand-num dictionary))
		(format t "dictionary now ~a~%" dictionary) ;test
		;; now dictionary has had removed thingy
		(dolist (ww word-list) (format t "~a " ww)) ; test print
		(format t "~%") ; test print
	))
	(format t "finish loop ~%")
	(setq word-list word-list)
)

;;------------------------------test-------------------------------------
(format t "running choose-words~%"); test
(dolist (word *word-dictionary*)
	(format t "~a, " word)
);test list is passed through
(format t "~%~%")
;;-------------------------------------------------------------------------

;(defvar *words* (choose-words *word-dictionary*)) 
(defvar *words* (choose-words *word-dictionary* 1)) 
(format t "~%~% words are: ~a~%" *words*)

#||
(defvar *words* (remove-word 5 *word-dictionary*)) 
(format t "~%~% word is: ~a~%" (nth 5 *word-dictionary*))

||#
