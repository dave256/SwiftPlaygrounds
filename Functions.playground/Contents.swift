//: ## examples of writing and calling functions
//: some taken from Apple's Swift iBook

//: ## functions with no return value
func helloWorld() {
    print("hello world")
}
helloWorld()

func hello(name: String) {
    print("hello " + name);
}
//: specify argument names when calling (does for readability)
hello(name: "Dave")

//: can indicate a different external parameter name should be used when calling function
func hello2(firstName name: String) {
    print("hello " + name);
}

hello2(firstName: "Dave")

//: and can indicate that parameter name will not be specified by using _ when specifiying external parameter name
func hello3(_ name: String) {
    print("hello " + name);
}

hello3("Dave")

//: ## functions with one return value

func helloString(name: String) -> String {
    let greeting = "hello \(name)"
    return greeting
}
print(helloString(name: "Jon"))

func helloFullName(first : String, last: String) -> String {
    return "hello \(first) \(last)"
}

print(helloFullName(first: "Dave", last: "Reed"))

//: ## functions that return multiple values as a tuple
//: will crash if sent an empty array

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let emptyItems = [Int]()
let items = [3, 1, 4, 1, 5, 9]
print(minMax(array: items))

//: can assign multiple variables to unwrap tuple
let (min, max) = minMax(array: items)
print("\(min) \(max)")

let bounds = minMax(array: items)
//: can use .0, .1 for tuple values
print(bounds.0, bounds.1)
//: or use names from return tuple
print(bounds.min, bounds.max)


//: returns an optional so can return nil
func minMaxOpt(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//: assign one value and check if nil returned
if let bounds = minMaxOpt(array: items) {
    print("min = \(bounds.min) max = \(bounds.max)")
}

if let bounds = minMaxOpt(array: emptyItems) {
    print("min = \(bounds.min) max = \(bounds.max)")
}
else {
    print("empty array")
}


//: ## default parameter values

// default values specified with = after Type and automatically have an external name
// note left off external name of first parameter
func join(string: String, toString: String, joiner: String = " ") -> String {
    return string + joiner + toString
}

join(string: "hello", toString: "world")
join(string: "hello", toString: "world", joiner: ",")


//: ## variadic parameters
//: use ... and then formal parameter is an array of values
func average(numbers: Double...) -> Double {
    var total = 0.0
    for value in numbers {
        total += value
    }
    return total / Double(numbers.count)
}

average(numbers: 3, 4, 5)
average()
average(numbers: 10, 2, 3, 5)


//: ## inout parameters (pass by reference)
func swap(_ x: inout Int, _ y: inout Int) {
    let temp = x
    x = y
    y = temp
}

var a = 3
var b = 4

//: must use explicity ampersand for readability when passing to inout parameter type
swap(&a, &b)
a
b

//: ## simple generic example
// note Swift has this builtin function named swap so writing our own is unnecessary
func swapGeneric<T>(_ x: inout T, _ y: inout T) {
    let temp: T = x
    x = y
    y = temp
}

swapGeneric(&a, &b)
var f1 = 2.5, f2 = 3.5
swapGeneric(&f1, &f2)
a
b
f1
f2


//: ## function types as parameter types

func square(x: Int) -> Int {
    return x * x
}

func cube(x: Int) -> Int {
    return x * x * x
}

var fSquare : (Int) -> Int = square
var fCube = cube
fSquare(2)
fCube(2)

func applyFunc(f : (Int) -> Int, x : Int) -> Int {
    return f(x)
}

applyFunc(f: fCube, x: 3)


//: ## function types as return types

func returnFunc() -> (Int) -> Int {
    return fSquare
}

returnFunc()(3)

