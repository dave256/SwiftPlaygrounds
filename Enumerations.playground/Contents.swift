//: ## enumerations are value types
//: one of a finite set of options
//: each option can also have an associated value

//: ## basic enumerations
enum Direction {
    case north
    case south
    case west
    case east
}

var direction: Direction = .north
print(direction)


//: ## enumeration with a type

enum DayOfWeek : String, CaseIterable {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

var day : DayOfWeek = .Wednesday
// vs. var day = "Sunday" which is susceptible to typo such as var day = "Wednsday"
// var day: DayOfWeek = .Wednsday produces an error

// prints actual value of the enumeration
print(day)

// since we gave the enum a type (String), we can use rawValue to get actual value
let wed = day.rawValue
print(wed)

// can convert from String to enumerated value but it gives you an optional since string may not be a valid value
day = DayOfWeek(rawValue: "Saturday")!
day.rawValue

// if conforms to CaseIteratble, can use .allCases property to get values in order
print("iterate")
for day in DayOfWeek.allCases {
    print(day)
}
print("end iteration")

//: ## enumeration with an associated value
//:  can be useful for return value from function that might fail

//:  can return Ok or an Error with an associated value; version 5 and later come with a Result type
enum MyResult {
    case Ok
    case Error(String)
}

var e1: MyResult = .Ok
var e2: MyResult = .Error("An error message")

switch e1 {
case .Ok:
    print("no error")
case .Error(let msg):
    print("error: \(msg)")
}
switch e2 {
case .Ok:
    print("no error")
case .Error(let msg):
    print("error: \(msg)")
}

// show that Enumerations are value types
var e3 = e2
e2 = .Ok
switch e2 {
case .Ok:
    print("no error")
case .Error(let msg):
    print("error: \(msg)")
}

// e3 is still the one with error message
switch e3 {
case .Ok:
    print("no error")
case .Error(let msg):
    print("error: \(msg)")
}

