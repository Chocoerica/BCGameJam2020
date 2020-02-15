import string
import random
import tkinter as tk

# tkinter set-up
root = tk.Tk()
frame = tk.Frame(root)
frame.pack()

root2 = tk.Tk()
words = tk.Frame(root2)
words.pack()

wordList = ['PROGRAMMING','CODE','ENCRYPTION','ALGORITHM','BOOLEAN','STRING','INTEGER','ARRAY','INTERNET','CIPHER','CAESAR',
                     'VARIABLES','DEBUGGING','FUNCTION','COMPRESSION','FILES','BINARY','BYTES','DATA','COMPRESSION','ENCODING','PACKETS',
                     'ROUTERS','INTERNET','ASYMMETRIC','SYMMETRIC','VIGENERE','DECRYPTING','CRACKING','LOOPS','PYTHON','JAVA','JAVASCRIPT',
                     'RUBY','BASIC','ASSEMBLY','LANGUAGE','COMPUTER','SOFTWARE','PROGRAMS','LIST','DATABASE','CLASS','OBJECT','MATRIX','THEORY',
                     'IMAGE','PACKETS','WHILELOOPS','ASCII','COMMAND','COMPILER','FLEMMING','EMULATOR','WINDOWS','DOS','SCRIPT','LINUX','MAC',
                     'FREEBSD', 'UBUNTU', 'ARCH', 'MINT', 'DEBIAN']



size = 25
numWords = 25

arr = [[0 for x in range(size)]for y in range(size)]
button = [[0 for x in range(size)]for y in range(size)]
check = [0 for numWords in range(size)]

dictionary = [0 for test in range(numWords)]

directionArr = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]

class square:
    status = False       # true = has been pressed
    char = ''           # character at location x, y
    filled = False      # does a character fill this space (f = no, t = yes)
    
def fill(x, y, word, direction):
    for i in range(len(word)):
        arr[x + direction[0]*i][ y + direction[1]*i].char = word[i]
        arr[x + direction[0]*i][ y + direction[1]*i].filled = True
        
def wordPlace(j, dictionary):    
    word = random.choice(wordList)
    direction = directionArr[random.randrange(0,7)]

    x = random.randrange(0, size-1)
    y = random.randrange(0, size-1)

    if(x + len(word)*direction[0] > size-1 or x + len(word)*direction[0] < 0
       or  y + len(word)*direction[1] > size-1) or y + len(word)*direction[1] < 0:
        #print("Failed range", x, y, direction, word)
        wordPlace(j, dictionary)
        return
    
    for i in range(len(word)):
        if(arr[x + direction[0]*i][y+ direction[1]*i].filled == True):
            if(arr[x + direction[0]*i][y+ direction[1]*i].char != word[i]):
                wordPlace(j, dictionary)
                return
    dictionary[j] = word
    #print(word)


    check[j] = tk.Label(words, text = word,height = 1, width = 15, font=('None %d ' %(10)), anchor = 'c')
    check[j].grid()

    
    fill(x, y, word, direction)
    return dictionary
    
pressedWord = ''
prev = [0,0]
route = [0,0]

def colourWord(pressedWord, valid):
    route[0] *= -1
    route[1] *= -1
    for i in range(len(pressedWord)):
        if valid == True or arr[prev[0]+i*route[0]][prev[1]+i*route[1]].status == True:
            button[prev[0]+i*route[0]][prev[1]+i*route[1]].config(bg='green')
            arr[prev[0]+i*route[0]][prev[1]+i*route[1]].status = True       
        elif(arr[prev[0]+i*route[0]][prev[1]+i*route[1]].status == False):
            button[prev[0]+i*route[0]][prev[1]+i*route[1]].config(bg= '#F0F0F0')


def checkWord():
    global pressedWord
    #print(pressedWord)

    if pressedWord in dictionary:
        #check[int(dictionary.index(pressedWord))].configure(overstrike=True)
        check[int(dictionary.index(pressedWord))].configure(font=('None %d overstrike' %(10)))
        check[int(dictionary.index(pressedWord))].grid()
        dictionary[dictionary.index(pressedWord)] = ''  #For cases when same word appears multiple times

        colourWord(pressedWord, True)
    else:
        colourWord(pressedWord, False)
    pressedWord = ''
    prev = [0,0]
    
  
def buttonPress (x, y):
    global pressedWord, prev, route
    print("x,y = ", x,y)
    if(len(pressedWord) == 0):
        prev = [x, y]
        print(prev)
        pressedWord = arr[x][y].char
        button[x][y].configure(bg='yellow')

    elif(len(pressedWord) == 1 and (x - prev[0])**2 <= 1 and (y - prev[1])**2 <= 1):
        pressedWord += arr[x][y].char
        button[x][y].configure(bg='yellow')
        
        print(x, prev[0])
        print(y, prev[1])
        
        route = [x-prev[0], y-prev[1]]
        print (route)
        print(pressedWord)
        prev = [x, y]
        
    elif(len(pressedWord) > 1 and x - prev[0] == route[0] and y - prev[1] == route[1]):
        pressedWord += arr[x][y].char
        button[x][y].configure(bg='yellow')
        print(pressedWord)
        prev = [x,y]

for x in range(size):
    for y in range(size):
        arr[x][y] = square()

for i in range(numWords):
    wordPlace(i, dictionary)
    #print(dictionary)
  
for y in range(size):
    for x in range(size):
        
        if(arr[x][y].filled == False):
            #arr[x][y].char = random.choice(string.ascii_uppercase)
            arr[x][y].char = ' '
        
        button[x][y] = tk.Button(frame, text = arr[x][y].char, bg= '#F0F0F0', width=2, height=1, command=lambda x=x, y=y: buttonPress(x, y))
        button[x][y].grid(row=x, column=y)

checkW = tk.Button(words, text = "check Word", height = 1, width = 15, anchor = 'c', command = checkWord)
checkW.grid()

root.mainloop()
