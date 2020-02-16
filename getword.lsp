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
function that returns 1 word at a time

need to see if word fits
if it fits, then remove word from temp-dictionary
||# 

(defun check-word-fit (word count) ; given word to fit in, etc. 
	;; if word fits, put it in grid
	;; returns bool of if it was successful or not
	(= 1 1)
)

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
		(format t "hi~%")
		(setq rand-num (random (- 41 x))) ; sets number to be from 0 to 39-x (0 to 39 first)
		(format t "~a and rand num is ~a ~%" x rand-num)
		
		;; need to add test if fit function SEE MITCH's CODE 
		(if (check-word-fit (nth rand-num dictionary) 0) ;; LATER SEE MITCH'S CODE
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
(defvar *words* (choose-words *word-dictionary* 45)) 
(format t "~%~% words are: ~a~%" *words*)

#||
(defvar *words* (remove-word 5 *word-dictionary*)) 
(format t "~%~% word is: ~a~%" (nth 5 *word-dictionary*))

||#
