;;;

;;; global states needed
(defvar *canvas-width* 800)
(defvar *canvas-height* 600)

;;;
;;; Main Class to run game

(gamekit:defgame main()()
	(:viewport-width *canvas-width*)
	(:viewport-height *canvas-height*)
	(:viewport-title "Word Search Game")
)
