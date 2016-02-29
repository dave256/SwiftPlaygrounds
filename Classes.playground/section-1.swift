// many more details in Swift book
// read Initialization chapter

//----------------------------------------------------------------------
// MARK: classes (reference types)

// CustomStringConvertible is a protocol
class Person: CustomStringConvertible {

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

    // convenience initializers must call a designated initializer
    convenience init() {
        // must use self to call the designated initializer
        self.init(firstName: "", lastName: "")
    }

    // a computed property (satisfies CustomStringConvertible)
    var description : String {
        return "\(firstName) \(lastName)"
    }

    // methods
    // by default first paramemter has a local name (and no external name), but subsequent parameters have a local and external name by default
    func changeFirstName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var empty = Person()
print(empty)
var me = Person(firstName: "Dave", lastName: "Reed")
print(me)
// note how this is called without firstName: "David"
me.changeFirstName("David", lastName: "Reed")
print(me)

//----------------------------------------------------------------------
// MARK: subclass

class Student: Person {
    // additonal property
    var idNumber: String

    // would need to prefix with override if superclass had init method with same parameter signature
    init(firstName: String, lastName: String, idNumber: String) {
        // must initialize new instance variables before calling super
        self.idNumber = idNumber
        // must delegate up to a superclass designated initializer
        super.init(firstName: firstName, lastName: lastName)

        // after calling super, can override values of inherited properites
        // self.firstName = "John"
    }

    convenience init() {
        self.init(firstName: "", lastName: "", idNumber: "")
    }

    // can override computed property
    override var description : String {
        return "\(super.description) \(idNumber)"
    }

    func changeFirstName(firstName: String, lastName: String, idNumber: String) {
        // call super method
        super.changeFirstName(firstName, lastName: lastName)
        // then update additional properties
        self.idNumber = idNumber
    }
}

let jane = Student(firstName: "Jane", lastName: "Doe", idNumber: "123456")
print(jane)
// calls method in base class
jane.changeFirstName("Jane", lastName: "Smith")
print(jane)

// classes are reference types
// so now both jane and jane2 refer to the same object
// and even though jane2 is decalred with let, that means it cannot point to a different object, the object it refers to can mutate
let jane2 = jane

// both jane and jane2 refer to the same object so have the new data
jane.changeFirstName("Jane", lastName: "Doe", idNumber: "987654")
print(jane)
print(jane2)
jane2.changeFirstName("Jane", lastName: "Jones", idNumber: "987654")
print(jane2)
print(jane2)
