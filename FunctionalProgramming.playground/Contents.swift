/*: 
 
 From [http://five.agency/functional-programming-in-swift/](http://five.agency/functional-programming-in-swift)


   There is no single and precise definition of functional programming, but maybe the best way is to do so in terms of goals the paradigm aims to achieve and tools it uses. The main high level goals for a functional program are modularity, careful treatment of mutable state and in some functional languages extensive usage of types to produce safe, easy to maintain, easy to test and performant code. Using simple functions and rich types we increase probability to catch bugs in compile time rather than in production. Functional programming is a declarative programming style that treats computation as the evaluation of mathematical functions. Using these pure functions as main building blocks avoids mutable state, especially shared mutable state. Functions are primary units of abstraction and base building blocks of a program, in contrast to object oriented paradigm where we have objects as main building blocks. Essence of functional programming is minimising and controlling side effects. This is achieved by using pure functions and value types as data those functions transform. In functional languages functions are not just transformations on some data represented with value types, they are first class type itself, so they can be used as inputs and outputs in other functions, the same way as any other type is used.
 
 Main requirements of functional programming:
 * immutability
 * value types
 * pure functions (no side-effects)
 * function chaining
 * functional composition
 * map, filter, reduce
 
 */

// procedural approach
let items =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var newValues: [Int] = []
for x in items {
    if x % 2 == 0 {
        newValues.append(3 * x + 1)
    }
}
newValues

// functional approach
let values = items.filter { $0 % 2 == 0 } .map { 3 * $0 + 1 }
values

// Swift reduce
let total = items.reduce(0, +)

// $0 is the accumulator variable, $1 is each item in array
let total2 = items.reduce(0) { $0 + $1 }
total2

let total3 = items.reduce(0) { $0 + 2 * $1 }
total3

let total4 = items.reduce(0) { 2 * $0 + $1 }
total4

// equivalent procedural version
var total5 = 0
for x in items {
    total5 = 2 * total5 + x
}
total5

/*:
 * compactMap - similar to map - apply operation in closure to each item to make new collection, except nil results are removed
 */

let inputValues = ["10", "Hello", "20", "30", "30.5"]
// note: Int("30.5") produces nil but Int(30.5) does not
let numbers = inputValues.compactMap() { Int($0) }
print(numbers)
let thirty = Int(30.5)
print(thirty)
