// examples of writing and calling functions
// some taken from Apple's Swift iBook

//----------------------------------------------------------------------
// MARK: functions with no return value
func helloWorld() {
    print("hello world")
}
helloWorld()

func hello(name: String) {
    print("hello " + name);
}
hello("Dave")

//----------------------------------------------------------------------
// MARK: functions with one return value
func helloString(name: String) -> String {
    let greeting = "hello \(name)"
    return greeting
}
print(helloString("Jon"))

func helloFullName(first : String, last: String) -> String {
    return "hello \(first) \(last)"
}

print(helloFullName("Dave", last: "Reed"))

//----------------------------------------------------------------------
// MARK: functions that return multiple values as a tuple
// will crash if sent an empty array
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

// returns an optional so can return nil
func minMaxOpt(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
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
print(minMax(items))

// can assign multiple variables to it
let (min, max) = minMax(items)
print("\(min) \(max)")

// assign one value and check if nil returned
if let bounds = minMaxOpt(items) {
    print("min = \(bounds.min) max = \(bounds.max)")
}

if let bounds = minMaxOpt(emptyItems) {
    print("min = \(bounds.min) max = \(bounds.max)")
}
else {
    print("empty array")
}

//----------------------------------------------------------------------
// MARK: specifying external parameter names for readability when calling

// when specifying external names, the syntax is external internal: Type
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}

// must specify external parameter names when calling
print(join(string: "hello", toString: "world", withJoiner: ","))

// use # sign to indicate the same name should be used for both external and internal parameter name
func join2(string string: String, toString: String, joiner: String) -> String {
    return string + joiner + toString
}

print(join2(string: "hello", toString: "world", joiner: ","))

//----------------------------------------------------------------------
// MARK: default parameter values

// default values specified with = after Type and automatically have an external name
// note left off external name of first parameter
func join3(s1 : String, toString: String, joiner: String = " ") -> String {
    return s1 + joiner + toString
}

join3("hello", toString: "world")
join3("hello", toString: "world", joiner: ",")

//----------------------------------------------------------------------
// MARK: variadic parameters

// use ... and then formal parameter is an array of values
func average(numbers: Double...) -> Double {
    var total = 0.0
    for value in numbers {
        total += value
    }
    return total / Double(numbers.count)
}

average(3, 4, 5)
average()
average(10, 2, 3, 5)

//----------------------------------------------------------------------
// MARK: in out parameters (pass by reference)
func swap(inout x: Int, inout y: Int) {
    let temp = x
    x = y
    y = temp
}

var a = 3
var b = 4
// must use explicity ampersand for readability when passing to inout parameter type
swap(&a, &b)
a
b

//----------------------------------------------------------------------
// MARK: simple Generic example
// note Swift has this builtin function named swap so writing our own is unnecessary
func swapGeneric<T>(inout x: T, inout _ y: T) {
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

//----------------------------------------------------------------------
// MARK: Function Types as Parameter Types

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

applyFunc(fCube, x: 3)


//----------------------------------------------------------------------
// MARK: Function Types as Return Types

func returnFunc() -> (Int) -> Int {
    return fSquare
}

returnFunc()(3)

