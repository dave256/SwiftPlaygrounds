/*:
#### Swift struct
* structs in Swift are value types and do **not** support inheritance
* methods that mutate the instance variables must be marked with keyword `mutating` before `func` keyword
* protection levels
  * `public` accessible anywhere
  * `internal` accessible in this module (the default if no protection level specified)
  * `fileprivate` accessible only in this file
  * `private` accessible only in this struct
*/

struct Point {
    var x: Double
    var y: Double

    // Swift will automatically generate an initializer (equivalent to C++ constructor) for you
    // for this struct, this is the init method the compiler would generate (so we didn't need to write it)
    // note: init does not have func before it
    init(x: Double, y: Double) {
        // self is unnecessary except in cases like this to distinguish between parameter
        // and instance variables with the same name
        self.x = x
        self.y = y
    }
}

var p = Point(x: 3, y: 4)
// can change instance variables (assuming have protection level access to them)
p.x = 1
p.y = 2


/*:
can also initialize variables in declaration
 */

struct Person {
    // type inference will make their type String
    var firstName = ""
    var lastName = ""

    // this is a computed property; on return statement is needed since only one statement
    var fullName: String { "\(firstName) \(lastName)" }

    // methods
    // if a structure method, changes the instance variables, need to mark as mutating
    mutating func changeNameTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// this will use the default values of empty strings
var person = Person()
// or can then write
person = Person(firstName: "John", lastName: "Smith")
// calling a method; use formal prameter names just as with functions
person.changeNameTo(firstName: "Jon", lastName: "Smith")


/*:
Can add new methods or computed properties to your types or even built-in types using `extension` keyword
Extensions cannot add new instance variables

 */
extension Person {
    var lastNameFirstName: String { "\(lastName), \(firstName)" }
}

/*:
protocol is a like a Java interface; lists properties/methods that a struct/class will implement if
 it says it conforms to the protocol

CustomStringConvertible is a protocol
requires description property to be implemented which is used to produce a String representation
description property is used when executing print(aPerson) or String(describing: aPerson)
 */

extension Person: CustomStringConvertible {
    var description : String { fullName }
}

/*:
 Generally should implement Equatable protocol for struct types
 Swift compiler will write one for you if all the instance variables are also Equatable
 Built-in types are equatable

 Equatable protocol defines the static property for comparing two values
 */

extension Person: Equatable {
    // in newer versions of Swift, compiler generates this code for you so not necessary to write
    // still need to indicate the type conforms to the Equatable protocol
    //    public static func ==(lhs: Person, rhs: Person) -> Bool {
    //        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    //    }
}

var me = Person(firstName: "Dave", lastName: "Reed")
//: uses description property to convert to a String
print(me)

me.changeNameTo(firstName: "David", lastName: "Reed")
print(me)

// because these are value types, dave and me refer to different data so changing one does not change the other
var dave = me
if dave == me {
    print("dave == me")
}

dave.firstName = "Dave"
if dave != me {
    print("after mutating, dave != me")
}

// still has David as firstName
print(me)

// has Dave as firstName
print(dave)

