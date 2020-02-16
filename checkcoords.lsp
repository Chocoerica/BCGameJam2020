;; function to check if coordinate is valid
#||
Function gets (x1 y1 x2 y2, wordlist) and uses global 2D array
Function checks if the string of characters between (x1, y1) and (x2, y2) is in the wordlist
if so, return wordlist with that word removed
otherwise return original worldlist
||#
;;Global stuffs
(setq *print-case* :downcase) ; all printed stuff will be lower case
;(setf *random-state* (make-random-state t)) ; set randomness
(defvar grid (make-array (list 5 5)))

(loop for x from 0 to 4
	do (loop for y from 0 to 4
		do (progn
			(if (eq nil (aref grid y x))
				(setf (aref grid y x) (string(code-char (+ (random 25) 97))) )
			)
		)
	)
)

(write grid)
(format t "~%")

(defun match-word (word tot-len wordlist) ; match against n index word in list, and return t or nil
	(if (eq (length wordlist) 0 ) 
		(progn
			(return-from match-word nil)
		)
		(progn
			;(format t "word: ~a and wordlist ~a ~%" word (car wordlist))
			(if (string-equal word (car wordlist)) ;test if word matches with first word of array
				(progn
					(format t "found~%")
					(setf n (- tot-len (length wordlist)))
					(return-from match-word n); if so, return index
				)
				(progn
					(return-from match-word (match-word word tot-len (cdr wordlist)))
				);run again with rest of list
			)
		)
	)
	
)

;; FUNCTION HERE
(defun check-coords (x1 y1 x2 y2 &optional wordlist)
	;;first check if coordinates are in a straight line
	(if (or (eq x1 x2) (eq y1 y2) (eq (abs (- x2 x1)) (abs (- y2 y1))) )
	;; if (x1 == x2) or (y1 == y2) or (abs(x1-x2) == abs(y1-y2)) then it works
		(progn
			(format t "straight line ~%")
			;;then check contents of coordinates
			;; first create word
			(let ((new-word "")(max-mvmt (max (abs (- x2 x1)) (abs(- y2 y1)) ))(col-num x1)(row-num y1)) 
				(loop for m from 0 to max-mvmt ; max-mvmt is maximal movement in any direction 
					do(progn
						(format t "col-num is: ~a row-num is: ~a ~%" col-num row-num)
						;; for each of loop -> collect current character, and add to string
						(setf new-word (concatenate 'string new-word (aref grid row-num col-num )))
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
						(format t " hey ~a ~%" new-word)
					;;recursive search 
						(setf index (match-word new-word (length wordlist) wordlist))
						(format t "word found at index ~a ~%" index)
						(format t "whoop~%")
					)
				)
			);;end of new-word and mvmt's lifespan
				
		)	
	
		(progn
			(format t "nope")
			;;just return wordlist
		)
	)
)

;;----------------------------test------------------------------------

(defvar *word-dictionary* (list "super" "good" "hello" "bear" "given" 
							"regret" "crocs" "apple" "heart" "love"     
							"wolf" "group" "monkeys" "challenge" "stress"
							"overcome" "prove" "reign" "succeed" "winner"  
							"truimph" "victory" "obstacle" "beaten" "rules" 
							"feel" "someone" "glory" "guts" "circle"      
							"friend" "everyone" "prevail" "pack" "pompassion" 
							"whylisp" "empathy" "suffering" "concern" "world" "mwb") )

(check-coords 2 2 0 0 *word-dictionary*)