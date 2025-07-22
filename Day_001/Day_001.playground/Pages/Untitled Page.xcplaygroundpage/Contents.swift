import Cocoa

var greeting = "Hello, playground"

let character = "Daphne"

var playerName = "Sam"
print(playerName)

playerName = "Sammy"
print(playerName)

playerName = "Sammy Joe"
print(playerName)

print(playerName.count)

let movie = """
the life of
Bryan - 
or whatever
"""

print (movie.count)

print (movie.uppercased())
print(movie.hasPrefix("the"))

let reallyBig = 1_00__00___00____00

let score = 10
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

let number = 120
print(number.isMultiple(of: 3))

let floatNumber = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
//let c = a + b
let c = a + Int(b)
print(c)


let firstPart = "Hello, "
let secondPart = "world!"
let greeting2 = firstPart + secondPart

