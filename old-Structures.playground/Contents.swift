//: ## Structures (value types and no inheritance)

struct Person {

    var firstName: String
    var lastName = ""

    // no func in front of init
    // if initialized all instance variables during declaration (as did with lastName above), a default initializer is automatically created
    init(firstName: String, lastName:String) {
        // use self if parameter has same name as instance variable, otherwisee
        // self is unnecessary

        self.firstName = firstName
        self.lastName = lastName
    }

    // methods
    // if a structure method, changes the instance variables, need to mark as mutating
    mutating func change(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//: CustomStringConvertible is a protocol

//: requires description property to be implemented which is used to produce a String representation

//: called when using print(aPerson) or String(describing: aPerson)
extension Person: CustomStringConvertible {
    var description : String {
        return "\(firstName) \(lastName)"
    }
}

//: generally should implement Equatable protocol for struct types

//: do not need to write != as compiler translates a != b to !(a == b)
extension Person: Equatable {
    // in newer versions of Swift, compiler generates code for you as long as each instance variable itself is equatable
//    public static func ==(lhs: Person, rhs: Person) -> Bool {
//        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
//    }
}

var me = Person(firstName: "Dave", lastName: "Reed")
//: uses description property to convert to a String
print(me)

me.change(firstName: "David", lastName: "Reed")
print(me)

//: because these are value types, dave and me refer to different data so changing one does not change the other
var dave = me

if dave == me {
    print("dave == me")
}

dave.firstName = "Dave"

if dave != me {
    print("after mutating, dave != me")
}

//: still has David as firstName
print(me)
me

//: has Dave as firstName
print(dave)
dave
