# BC Game Jam 2020
Erica

Mitch 

VJ

## TO-DOs
 * `mitch` need to put word into puzzle, generate coordinates of word
   * create 2d array init 0's
   * should verify no overlapping words
 * `erica` print as matrix into tty
   * list coordinate for puzzle matrix
 * `vj` io system for interactivity, x y coor's
 * coor verfification 
 * `erica` master dict of words for puzzle to randomly grab from
 * *bulatov accent* "`trivial`" method for filling unpopulated cells with giberish
 * Figure out how to transfer inputs and outputs onto word-search.lisp file

To compile:
(ql:quickload :word-search)

To run:
(gamekit:start 'word-search:word-search)
need to stop before compile:
(gamekit:stop) --> doesn't work, need to restart terminal
