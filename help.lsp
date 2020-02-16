; 3 2 1
;  \|/
;4--+--0
;  /|\
; 5 6 7

(setf *random-state* (make-random-state t))

;check-word-fit


(defun check-word-fit(wordString count)

	;(defvar wordString "This")
	(print "Count =")
	(print count)
	(defvar size 10)
	;(defvar direction (random 8))
	(defvar direction 3)
	(setf x (random size))	
	(setf y (random size))	
	(defvar wordLength (length wordString))
	;(write (make-array (list size size) :initial-element '0))
	;(setf (aref make-array 2 4) "1")
	;(terpri)


	(setq test (make-array (list size size)))
	(setf (aref test x y) direction)
	(write test)
	
	(if (or (or (eq `(,direction) 2) (eq `(,direction) 1)) (eq `(,direction) 3)) ;UP
		(print (- y wordLength))
		(if(> 0 (- y wordLength))
			;(print "This is bad")))
			(check-word-fit wordString (+ count 1))))

	(if (or (or (eq `(,direction) 5) (eq `(,direction) 4)) (eq `(,direction) 3)) ;left
		(print (- x wordLength))
		(if(> 0 (- x wordLength))
			;(print "This is bad")))
			(check-word-fit wordString (+ count 1))))

	(if (or (or (eq `(,direction) 5) (eq `(,direction) 6)) (eq `(,direction) 7)) ;down
		(print (+ y wordLength))
		(if(> wordLength (+ y wordLength))
			;(print "This is bad")))
			(check-word-fit wordString (+ count 1))))

	(if (or (or (eq `(,direction) 7) (eq `(,direction) 0)) (eq `(,direction) 1)) ;right
		(print (+ x wordLength))
		(if(> wordLength (+ x wordLength))
			;(print "This is bad")))
			(check-word-fit wordString (+ count 1))))

	;(setq ((wordLength)(length wordString))

	;(print wordLength)
	;(print direction)
	;(print x)
	;(print y)

)

(check-word-fit "Hello" 0)



