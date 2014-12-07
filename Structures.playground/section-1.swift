//----------------------------------------------------------------------
// MARK: structures (value types)
//

struct Person {

    var firstName: String;
    var lastName = "";

    // no func in front of init
    // if initialized all instance variables during declaration (as did with lastName above), a default initializer is automatically created
    init(firstName: String, lastName:String) {
        // use self if parameter has same name as instance variable, otherwisee
        // self is unnecessary

        self.firstName = firstName;
        self.lastName = lastName;
    }


    // a computed property
    var description : String {
        return "\(firstName) \(lastName)"
    }

    // methods
    // if a structure method, changes the instance variables, need to mark as mutating
    mutating func changeFirstName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var me = Person(firstName: "Dave", lastName: "Reed")
me.description
// note how this is called without firstName: "David"
me.changeFirstName("David", lastName: "Reed")
me.description

// because these are value types, dave and me refer to different data so changing one does not change the other
var dave = me
dave.firstName = "Dave"

// still has David as firstName
me
// has Dave as firstName
dave

