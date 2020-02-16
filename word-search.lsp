;;;

;;; global states needed
(defvar *canvas-width* 800)
(defvar *canvas-height* 600)
(defvar *click* nil) ;t when mouse is being pressed, nil otherwise
(defvar *color1* (gamekit:vec4 0 0 0 1)) ;for drawing
(defvar *color2* (gamekit:vec4 0.2 0.3 1 1))
;;;
;;; Main Class to run game

(gamekit:defgame main()()
	(:viewport-width *canvas-width*)
	(:viewport-height *canvas-height*)
	(:viewport-title "Word Search Game")
)

;;; Bindings
(gamekit:bind-button :mouse-left :pressed
		     (lambda () (setf *click* t)))
(gamekit:bind-button :mouse-left :released 
		     (lambda () (setf *click* nil)))
(gamekit:bind-cursor(lambda(x y)
		      (when *click*
			;; put x, y position into doing something here - translate into input of currfile
			)))

(gamekit:bind-button :q :pressed (lambda () 
				   ;quit function
				   (gamekit:stop)
				   ))
;;Drawing Game Board
(defmethod gamekit:draw((app word-search))
  ;do all drawing stuff inside here
  (gamekit:draw-rect (gamekit:vec2 10 10) :fill-paint *color1*)
 )

