
//: ## IMPORTANT: builtin types (including strings, arrays, dictionaries) are value types; assignment makes a copy (uses copy on write for efficiency)

import Foundation


//: ## Constants and Variables
//: variables have a type that is implicitly or explictily set when initialized

//: use let to declare a constant (and is preferred unless you need a variable)
let constantIntegerValue = 42

//: note: need a space after last character in variable name and before =
//: this gives error: Prefix/postfix '=' is reserved

//: let constantIntegerValue2= 42 // this is an error

//: use var to define a variable
var variableIntegerValue = 20
variableIntegerValue += 10

//: using an explicit type:
var i: Int = 5


//: ## Integer types
//: Swift is strongly typed

//: variableIntegerValue = 42.5 // this is an error since it was originally an int


//: other Int types
var i8: Int8 = 127
var i16: Int16 = 32767
var i32: Int32 =  10
var i64: Int64 = 10

//: also unsigned versions
var ui: UInt = 10
var ui8: UInt8 = 255
var ui16: UInt16 = 65535
var ui32: UInt32 = 10
var ui64: UInt64 = 10


//: ## Floating point types
//: Float and Double; also Float64 and Float80
var floatValue: Float = 3.14
let doubleValue: Double = 3.14159
let pi = 3.14159265358979359 // defaults to Double



//: ## Strings and output
var s = "abc"

// print
// string interpolation is done by \(varname)
print("ui=\(ui) and s=\(s)")

//: string formatting (similar to Python/C formatting); not really built-in have to import Foundation for this to work

//: %d or % i for Int;
//: %ud or %ui for Uint;
//: %f for Float;
//: %lf for Double;
//: %@ for any NSObject subclasses (calls the description method)

let fs1 = String(format: "i=%2d pi=%0.3f", i, doubleValue)

//: note, for NSNumber, have to cast it (or use %@ but then can't format to total number of spaces or decimals
let num: NSNumber = 3.14159
let fs2 = String(format: "pi=%0.3f", num)
let fs3 = String(format: "pi=%@", num)

//: ## Tuple
//: (similar to Python tuples but typed)
//:
//: as with all Swift types, var/let specify mutable/immutable

var intStringTuple = (3, "abc")
//: this would cause an error due to strong typing

//: intStringTuple = (3, 4)

//: access tuple elments using . followed by position
print("\(intStringTuple.0) \(intStringTuple.1)")
intStringTuple.0 = 5
intStringTuple.1 = "def"
print("\(intStringTuple.0) \(intStringTuple.1)")

//: can explicitly declare with types
var intStringTuple2: (Int, String) = (4, "def")


//: ## Array
//: ordered homogeneous type; type can be implicitly determined but explicit in this example

var arrayOfInts: [Int] = [2, 3, 4]

//: empty array
var arrayOfInts2: [Int] = []

//: can declare empty array with a type this way too:
var arrayOfInts3 = [Int]()

//: arrays have methods (a few listed here)
arrayOfInts.append(5)

//: note the syntax for additional parameters
arrayOfInts.insert(6, at: 2)

//: note no () for count as it is a property
i = arrayOfInts.count

//: ## Dictionary
//: map one type to another
var dictionary = [String:Int]()
dictionary["abc"] = 3
dictionary["def"] = 4
for k in dictionary.keys {
    print("\(k) \(String(describing: dictionary[k])) \(dictionary[k]!)")
}

//: ## Set
//: unordered collection with no duplicates

//: declare using generic syntax and then use brackets as array does


var setOfInt: Set<Int> = [1, 2, 3]
setOfInt.insert(4)
print(setOfInt.contains(3))
setOfInt.remove(3)
print(setOfInt.contains(3))

//: ## Any and AnyObject
//: Any can hold any type except function types

//: allows arrays, etc. of mixed types

var arrayOfAny: [Any] = []
arrayOfAny.append(2)
arrayOfAny.append(3.5)
arrayOfAny.append("hello")
//: add a tuple
arrayOfAny.append((2, 3))
arrayOfAny

//: AnyObject can hold instance of a class
var arrayOfAnyObject: [AnyObject] = []


//: ## Optional
//: any type can be specified as option meaning it either holds a value
//: of that type or nil; add quesiton mark after type name
//:
//: fundamental concept of Swift is safety; all non-optionals can't be used before they have an initial value

//: x is nil since no value yet
var x: Int?
//: now 3
x = 3
//: ok to assign back to nil
x = nil

//: unwrap the optional via if statement
//: evalutes to try if x is not nil and temp is assigned the value
if let temp = x {
    print("x is not nil: \(temp)")
}
else {
    print("x is nil")
}

x = 3
if let temp = x {
    print("x is not nil: \(temp)")
}

//: or if you know x is not nil, you can append a !
//: but generally discouraged
x!

x = nil
//: this would crash since x is nil

//: x!


//: ## typealias (similar to typedef in C/C++)
//: can create type synonyms
typealias AudioSample = UInt16
var audioSample: AudioSample = 10

