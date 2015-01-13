// enumerations are value types

// MARK: basic enumerations
enum Direction {
    case North
    case South
    case West
    case East
}

var direction: Direction = .North

//---------------------------------------
// MARK:-
// MARK: enumeration with raw values

enum DayOfWeek : String {
    case Sunday = "Sunday"
    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
}

var day : DayOfWeek = .Wednesday
// vs. var day = "Sunday" which is susceptible to typo such as var day = "Wednsday"
// var day: DayOfWeek = .Wednsday produces an error

// not useful
println(day)

// since we assiged each corresponding string, we can use rawValue to get useful value
println(day.rawValue)

// can convert from String to enumerated value but it gives you an optional since string may not be a valid value
day = DayOfWeek(rawValue: "Saturday")!
day.rawValue

//---------------------------------------
// MARK:-
// MARK: enumeration with associated value
// can be useful for return value from function that might fail
// can return Ok or an Error with an associated value
enum MyError {
    case Ok
    case Error(String)
}

var e1: MyError = .Ok
var e2: MyError = .Error("An error message")

switch e1 {
case .Ok:
    println("no error")
case .Error(let msg):
    println("error: \(msg)")
}
switch e2 {
case .Ok:
    println("no error")
case .Error(let msg):
    println("error: \(msg)")
}

// show that Enumerations are value types
var e3 = e2
e2 = .Ok
switch e2 {
case .Ok:
    println("no error")
case .Error(let msg):
    println("error: \(msg)")
}

// e3 is still the one with error message
switch e3 {
case .Ok:
    println("no error")
case .Error(let msg):
    println("error: \(msg)")
}

