(setq *print-case* :downcase) ; all printed stuff will be lower case
(setf *random-state* (make-random-state t)) ; set randomness

(defvar *word-dictionary* (list "Super" "Good" "Hello" "Bear" "Given" 
							"Regret" "Crocs" "Apple" "Heart" "Love"     
							"Wolf" "Group" "Monkeys" "Challenge" "Stress"
							"Overcome" "Prove" "Reign" "Succeed" "Winner"  
							"Truimph" "Victorious" "Obstacle" "Beaten" "Rules" 
							"Oranges" "Feel" "Someone" "Glory" "Guts"      
							"Friend" "Everyone" "Prevail" "Pack" "Compassion" 
							"WhyLisp" "Empathy" "Suffering" "Concern" "World" ) )
#||                                         
function that returns 1 word at a time

need to see if word fits
if it fits, then remove word from temp-dictionary

||# 

(defun remove-word (index list)
	(if (zerop index)(cdr list) 
		(cons (car list) (remove-word (1- index) (cdr list)))
	)
)

(defun choose-words (dictionary &optional num-words) ;;given a list of 40 words, returns a list of num-words words
	(format t "running choose-words~%"); test
	(dolist (word dictionary)
		(format t "~a, " word)
	);test list is passed through
	(defvar word-list (list))
	(dolist (ww word-list) (format t "~a " ww)) ; test print
	(format t "~%") ; test print
	(if (eq num-words nil)
		(setf num-words 3)
	); if num-words is not inputted into the parameter, then it is automatically 3
	;; using loop do get random indexes - assume dictionary has 40 words
	(let ((rand-num 0)))
	(loop for x from 0 to (- num-words 1)
	do(progn
		(format t "hi~%")
		
		(setq rand-num (random (- 39 x))) ; sets number to be from 0 to 39-x (0 to 39 first)
		(format t "~a and rand num is ~a ~%" x rand-num)
		;;get word using index, then remove it from local list
		(setq dictionary (remove-word rand-num dictionary))
		;; now dictionary has had removed thingy
		(format t "before set word-list~%")
		(push (nth rand-num dictionary) word-list)
		(format t "after~%")
		(dolist (ww word-list) (format t "~a " ww)) ; test print
		(format t "~%") ; test print
		
	))
	(format t "finish loop ~%")
	(setq word-list word-list)
)

(defvar *words* (choose-words *word-dictionary*)) 
(format t "~%~% words are: ~a~%" *words*)