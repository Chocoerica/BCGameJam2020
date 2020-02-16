;;; WHAT THIS FILE MIGHT DO:
;; idk

(in-package #:word-search)


(setq *print-case* :downcase) ; all printed stuff will be lower case
(setf *random-state* (make-random-state t)) ; set randomness

(defvar *word-dictionary* (list "super" "good" "hello" "bear" "given" 
							"regret" "crocs" "apple" "heart" "love"     
							"wolf" "group" "monkeys" "challenge" "stress"
							"overcome" "prove" "reign" "succeed" "winner"  
							"truimph" "victory" "obstacle" "beaten" "rules" 
							"feel" "someone" "glory" "guts" "circle"      
							"friend" "everyone" "prevail" "pack" "compassion" 
							"whylisp" "empathy" "suffer" "concern" "world" ) )


(defvar size 10)

(defvar count2 0)
(defvar wordLength 0)
(defvar *test* (make-array (list size size)))
(defvar playing t)
(defvar start 0)
(defvar end 0)

; this needs to be in a while forever loop with an escape condition
(defun take_input() 
    (princ "Enter starting coordinates in as a pair, ex (x y): ")
    (setq start (read-from-string (read-line)))

    (princ "Enter ending coordinates in as a pair, ex (x y): ")
    (setq end (read-from-string (read-line)))

    (if (or 
        
        (or (< (car start) 0) (>= (car start) size))
        (or (< (second start ) 0) (>= (second start) size))

        (or (< (car end) 0) (>= (car end) size))
        (or (< (second end ) 0) (>= (second end) size) )
        
        )
        ;; 0 <= start < size || 0 <= end < size
        (progn  (princ "Invalid input >:( ......Try again")
                (terpri)
                (take_input)
        )
    )
)

(defun rand-fill-in() ;;fills in non-nil index size by size grid with strings
	(loop for x from 0 to (- size 1)
		do (loop for y from 0 to (- size 1)
			do (progn
				(if (eq nil (aref *test* y x))
					(setf (aref *test* y x) (string(code-char (+ (random 25) 97))) )
				)
			)
		)
	)
)

(defun match-word (word tot-len word-list) 
	;; match against n index word in list, and return t or nil
	;;used in check-coords
	(if (eq (length word-list) 0 ) 
		(progn
			(return-from match-word nil)
		)
		(progn
			;(format t "word: ~a and wordlist ~a ~%" word (car wordlist))
			(if (string-equal word (car word-list)) ;test if word matches with first word of array
				(progn
					(format t "found~%")
					(setf n (- tot-len (length word-list)))
					(return-from match-word n); if so, return index
				)
				(progn
					(return-from match-word (match-word word tot-len (cdr word-list)))
				);run again with rest of list
			)
		)
	)
	
)

;; Check if two point's coordinates create a word
(defun check-coords (x1 y1 x2 y2 &optional word-list)
	;;first check if coordinates are in a straight line
	(if (or (eq x1 x2) (eq y1 y2) (eq (abs (- x2 x1)) (abs (- y2 y1))) )
	;; if (x1 == x2) or (y1 == y2) or (abs(x1-x2) == abs(y1-y2)) then it works
		(progn
			;; (format t "straight line ~%")
			;;then check contents of coordinates
			;; first create word
			(let ((new-word "")(max-mvmt (max (abs (- x2 x1)) (abs(- y2 y1)) ))(col-num x1)(row-num y1)) 
				(loop for m from 0 to max-mvmt ; max-mvmt is maximal movement in any direction 
					do(progn
						;; (format t "col-num is: ~a row-num is: ~a ~%" col-num row-num)
						;; for each of loop -> collect current character, and add to string
						(setf new-word (concatenate 'string new-word (aref *test* row-num col-num )))
						(if (> (- x2 col-num) 0) (setq col-num (+ col-num 1)))
						(if (< (- x2 col-num) 0) (setq col-num (- col-num 1)))
						(if (> (- y2 row-num) 0) (setq row-num (+ row-num 1)))
						(if (< (- y2 row-num) 0) (setq row-num (- row-num 1))) ; MAYBE CHANGE LATER DEPENDS ON X Y
						;;if (x2-col-num > 0) then loop col-num = col-num+1 each time
						;;if (x2-col-num < 0) then loop col-num = col-num-1 each time
						;; if (y2-y1>0) then loop y = y+1 each time
						;; if (y2-y1< 0) then loop y = y-1 each time
						
					)
				)
				(if (> (length new-word) 0) 
					;check against word-list
					(progn
						;; (format t " hey ~a ~%" new-word)
					;;recursive search 
						(let ((index (match-word new-word (length word-list) word-list)))
							;; (format t "word found at index ~a ~%" index)
							;; (format t "whoop~%")
							; return wordlist without that thing at index i
							(if (not (eq nil index))
								(progn
									(let ((new-word-list (remove-word index word-list)))
										(return-from check-coords new-word-list)
									)
								)
								(return-from check-coords word-list)
							)
							
						);end lifespan of index						
					)
				)
			);;end of new-word and mvmt's lifespan
				
		)	
	
		(progn
			(format t "nope")
			(return-from check-coords word-list)
			;;just return wordlist
		)
	)
)

(defun check-word-fit(wordString);check-word-fit given word to fit in, etc. CHECK MITCH CODE
;; if word fits, put it in grid
;; returns bool of if it was successful or not
	;; (format t "count is ~a ~%" count2)
	;(defvar wordString "This")
;	(print "Count =")
;	(print count)
	;(defvar direction (random 8))
	(setf direction (random 7))
	
	(print wordString)
	(setf x (random size))	
	(setf y (random size))	
	(setf wordLength (length wordString))
	(print wordLength)
	(format t "~%x-coord(y) = ~A~%" y)
	(format t "y-coord(x) = ~A~%" x)
	(format t "direction = ~A~%" direction)
	;(write (make-array (list size size) :initial-element '0))
	;(setf (aref make-array 2 4) "1")
	;(terpri)


	(if (> count2 10)
		(return-from check-word-fit nil)	
	)
	
	
	(if (or (or (eq direction 2) (eq direction 1)) (eq direction 3)) ;UP
		(progn
			(format t "direction = ~A~%" direction)
			(format t "x end is ~d~%" (- x wordLength))
			(if(> -1 (- x wordLength))
				(progn
					(print "This is bad 1") 
					(setf count2 (+ count2 1))
					(return-from check-word-fit (check-word-fit wordString))
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
					(return-from check-word-fit (check-word-fit wordString))
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
					(return-from check-word-fit (check-word-fit wordString))
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
					(return-from check-word-fit (check-word-fit wordString))
				)
			)
		)
	)
	
	(let ((x1 x) (y1 y))
		(loop for i from 0 to (- wordLength 1)
			do (progn (if (not (eq (aref *test* x1 y1) nil))
				; intersection will occur disallow
				(progn
					(princ "INTERSECTION!!!!")
					(format t "~%x is ~A ~%y is ~A~%" x1 y1)
					(incf count2 1)
					(return-from check-word-fit (check-word-fit wordString))
				)
			)

			; adjust coords
			(if (or (or (eq direction 2) (eq direction 1)) (eq direction 3)) ;UP
				(progn
		;		(print "if one")
					(setf x1 (- x1 1))
				)
			)

			(if (or (or (eq direction 5) (eq direction 4)) (eq direction 3)) ;left
				(progn
		;		(print "if two")
				(setf y1 (- y1 1))
				)
			)

			(if (or (or (eq direction 5) (eq direction 6)) (eq direction 7)) ;down	
				(progn
		;		(print "If three")
					(setf x1 (+ x1 1))
				)
			)

			(if (or (or (eq direction 7) (eq direction 0)) (eq direction 1)) ;right
				(progn
		;		(print "if four")
					(setf y1 (+ y1 1))
				)
			))
		
		)
	
	)	

	;; (print "there")
	(loop for c across wordString
		do (progn
;			(print direction)
;			(print c)
;			(print x)
;			(print y)
			(setf (aref *test* x y) c)
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
	) ;; loop ends here

	;; (write test)
	;(setq ((wordLength)(length wordString))

	;; ;(print wordLength)
	;; ;(print direction)
	;; ;(print x)
	;; ;(print y)
	(return-from check-word-fit t)
)

;;----------------------------

(defun remove-word (index list)
	(if (zerop index)(cdr list) 
		(cons (car list) (remove-word (1- index) (cdr list)))
	)
)

;; function chooses words and populates a 2D array
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
	;;(let ((rand-num 0)))
	(loop for x from 0 to (min (- num-words 1) 39)
	do(progn
		;; (format t "hi from choose-words~%")
		(setq rand-num (random (- 40 x))) ; sets number to be from 0 to 39-x (0 to 39 first)
		;;(format t "~a and rand num is ~a ~%" x rand-num)
		
		;; need to add test if fit function SEE MITCH's CODE 
		(setf count2 0)
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
	;; (format t "finish loop ~%")
	(setq word-list word-list)
)

(defun print-grid (grid &optional *words*) ;;fills in non-nil index size by size grid with strings
	(format t "~%~%WORDS to find: " )
			(dolist (ww *words*) (format t "~a " ww)) ; print words
			(format t "~%")
	(format t "  ")
	(loop for y from 0 to (- size 1)
		do(progn
			(format t "~a " y)
		)
	)
	(format t "~%")
	(loop for y from 0 to (- size 1)
		do (progn
			(format t "~a " y)
			(loop for x from 0 to (- size 1)
				do (progn
					(if (eq nil(aref grid y x)) 
						(format t "  ") 
						(format t "~a "(aref grid y x))
					)
				)
			)
		)
		(format t "~%")
	)
)

(defun idk()
	(princ "Welcome to the end of your existence")
    (terpri)
    (princ "To play the game just enter (x y) coordinates when prompted along w/ the paranthesis.")
    (terpri)
    (princ "Enter \"q\" w/o the quotes to exist the game")
    (terpri)
    (princ "Enter Y to begin..............")
    (read)
	(loop 
        (progn
            ; print board
            (print-grid *test*)
            (terpri)

            ; take input
            (take_input)

            ; verify
            (if (not (eq (length *words*) 0))
                (setf *words* (check-coords (first start) (second start) (first end) (second end) *words*))
                ;(dolist (ww *words*) (format t "~a " ww)) ; print words
            )
        )
    )
)

(defun gen-start()
    (defvar *words* (choose-words *word-dictionary* 8)) 
    (rand-fill-in)
)


;'----------------GAME STUFFS------------------------------------------------------------------------------------------------
;;; global states needed
(defvar *canvas-w* 1000)
(defvar *canvas-h* 950)
(defvar *click* nil) ;t when mouse is being pressed, nil otherwise
(defvar *color1* (gamekit:vec4 0 0 0 1)) ;for drawing
(defvar *color2* (gamekit:vec4 0.1 0.3 0.9 0.5))
(defvar *color3* (gamekit:vec4 0.8 0.8 0.8 0.5))
;;;
;;; Main Class to run game

(gamekit:defgame word-search()()
	(:viewport-width *canvas-w*)
	(:viewport-height *canvas-h*)
	(:viewport-title "Word Search Game")

)

;;; Bindings
(defmethod gamekit:post-initialize ((app word-search))
	(gamekit:bind-button :mouse-left :pressed
				(lambda () (setf *click* t)))
	(gamekit:bind-button :mouse-left :released 
				(lambda () (setf *click* nil)))
	(gamekit:bind-cursor(lambda(x y)
				(when *click*
				;; put x, y position into doing something here - translate into input of currfile
				;; INPUT GOES IN HERE 
				)))

	(gamekit:bind-button :q :pressed (lambda () 
					;quit function
					(gamekit:stop)
					))

	;; MAKE BOARD WHEN INITIALIZE
	(gen-start) ; get *words* and *test* as global variables

)

;;Drawing Game Board
(defmethod gamekit:draw((app word-search))
	;do all drawing stuff inside here --> AT START OF GAME
	(gamekit:draw-rect (gamekit:vec2 0 0) 1000 1000 :fill-paint *color1* :stroke-paint nil) ;background black
	(gamekit:draw-rect (gamekit:vec2 200 300) 600 600 :fill-paint nil :stroke-paint *color2*) ;draw 10 by 10 grid

	;grid lines
	(loop for i from 0 to 8
		do(progn
			( let ((n (+ (* 60 i) 300)))
				(gamekit:draw-line (gamekit:vec2 n 300) (gamekit:vec2 n 900) *color2*)
			)
			( let ((n (+ (* 60 i) 400)))
				(gamekit:draw-line (gamekit:vec2 200 n) (gamekit:vec2 800 n) *color2*)
			)
		)
	)

	;get letters from global variables *words* and *test*
	;; get (aref grid x y)?

	(loop for y from 0 to 9
		do (progn
			(format t "~a " y)
			(loop for x from 0 to 9
				do (progn
					(gamekit:draw-text (aref *test* x y) (gamekit:vec2 (+ (* x 60) 200) (+ (y 60) 200) ) :fill-color *color2* )
				)
			)
		)
	)
	(dolist (ww *words*) 
		(gamekit:draw-text ww (gamekit:vec2 100 (- (* x 20) 290)) :fill-color *color3*)
	) ; print words

	

 	;;---------------------------------
	(gamekit:draw-text "WORD SEARCH: made from LISP" (gamekit:vec2 250 925) :fill-color *color3*) ; title
	
	(gamekit:draw-text "By: Keepers of the Parentheses" (gamekit:vec2 500 125) :fill-color *color3*) ; group name

 )