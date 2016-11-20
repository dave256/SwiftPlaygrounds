//: ## Structures (value types)

// CustomStringConvertible is a protocol
struct Person: CustomStringConvertible {

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


    // a computed property (satisfies CustomStringConvertible)
    var description : String {
        return "\(firstName) \(lastName)"
    }

    // methods
    // if a structure method, changes the instance variables, need to mark as mutating
    mutating func change(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var me = Person(firstName: "Dave", lastName: "Reed")
//: uses description property to convert to a String
print(me)
// note how this is called without firstName: "David"
me.change(firstName: "David", lastName: "Reed")
print(me)

//: because these are value types, dave and me refer to different data so changing one does not change the other
var dave = me
dave.firstName = "Dave"

//: still has David as firstName
print(me)
me

//: has Dave as firstName
print(dave)
dave
