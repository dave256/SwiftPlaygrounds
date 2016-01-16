//----------------------------------------------------------------------
// IMPORTANT: builtin types (including strings, arrays, dictionaries) are value types
// assignment makes a copy

import Foundation

//----------------------------------------------------------------------
// MARK: constant and variable declarations
// variables have a type and implicitly set when initialized
// use let to declare a constant
let constantIntegerValue = 42
// note: need a space after last character in variable name and before =
// this gives error: Prefix/postfix '=' is reserved
// let constantIntegerValue2= 42


// use var to define a variable
var variableIntegerValue = 20

//----------------------------------------------------------------------
// MARK: integer types
// Swift is strongly typed
// this would cause an error
// variableIntegerValue = 42.5

// can also declare a variable with a type
var i: Int
i = 3

// other Int types
var i8: Int8 = 127
var i16: Int16 = 32767
var i32: Int32 =  10
var i64: Int64 = 10

// also unsigned versions
var ui: UInt = 10
var ui8: UInt8 = 255
var ui16: UInt16 = 65535
var ui32: UInt32 = 10
var ui64: UInt64 = 10

//----------------------------------------------------------------------
// MARK: float types
// Float and Double; also Float64 and Float80
var floatValue: Float = 3.14
let doubleValue: Double = 3.14159

//----------------------------------------------------------------------
// MARK: typealias (typedef in C/C++)
// can create type synonyms
typealias AudioSample = UInt16
var audioSample: AudioSample = 10

//----------------------------------------------------------------------
// MARK: strings and output
// strings
var s = "abc"

// print and println take one parameter (and optional second parameter that is a TargetStream
// string formatting is done by \(varname)
print("ui=\(ui) and s =\(s)")

//----------------------------------------------------------------------
// MARK: string formatting
// similar to Python/C formatting
// not really built-in have to import Foundation for this to work
// %d or % i for Int
// %ud or %ui for Uint
// %f for Float
// %lf for Double
// %@ for any NSObject subclasses (calls the description method)

let fs1 = String(format: "i=%2d pi=%0.3f", i, doubleValue)

// note, for NSNumber, have to cast it (or use %@ but then can't format to total number of spaces or decimals
let num: NSNumber = 3.14159
let fs2 = String(format: "pi=%0.3f", num as Double)
let fs3 = String(format: "pi=%@", num)

//----------------------------------------------------------------------
// MARK: tuples
// tuples (like Python tuples but typed) although var/let specify mutable/immutable
var intStringTuple = (3, "abc")
// this would cause an error due to strong typing
// intStringTuple = (3, 4)
// access tuple elments using . followed by position
print("\(intStringTuple.0) \(intStringTuple.1)")
intStringTuple.0 = 5
intStringTuple.1 = "def"
print("\(intStringTuple.0) \(intStringTuple.1)")

// can explicitly declare with types
var intStringTuple2: (Int, String) = (4, "def")

//----------------------------------------------------------------------
// MARK: arrays
// arrays (type can be implicitly determined but explicit in this example)
// array values must all be the same type
var arrayOfInts: [Int] = [2, 3, 4]
// empty array
var arrayOfInts2: [Int] = []
// can declare empty array with a type this way too:
var arrayOfInts3 = [Int]()

// arrays have methods (a few listed here)
arrayOfInts.append(5)
// note the syntax for additional parameters
arrayOfInts.insert(6, atIndex: 2)
// note no () for count
i = arrayOfInts.count

//----------------------------------------------------------------------
// MARK: dictionaries
// map one type to another
var dictionary = [String:Int]()
dictionary["abc"] = 3
dictionary["def"] = 4
for k in dictionary.keys {
    print("\(k) \(dictionary[k]) \(dictionary[k]!)")
}

//----------------------------------------------------------------------
// MARK: Any can hold any type except function types
// allows arrays, etc. of mixed types
var arrayOfAny: [Any] = []
arrayOfAny.append(2)
arrayOfAny.append(3.5)
arrayOfAny.append("hello")
// add a tuple
arrayOfAny.append((2, 3))
arrayOfAny

//----------------------------------------------------------------------
// MARK: AnyType can hold instance of a class
var arrayOfAnyObject: [AnyObject] = []

//----------------------------------------------------------------------
// MARK: optionals
// any type can be specified as option meaning it either holds a value
// of that type or nil; add quesiton mark after type name

// x is nil since no value yet
var x: Int?
// now 3
x = 3
// ok to assign back to nil
x = nil

// unwrap the optional via if statement
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

// or if you know x is not nil, you can append a !
x!

x = nil
// this would crash since x is nil
// x!



