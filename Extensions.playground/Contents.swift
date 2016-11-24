//: ## Extensions

//: can add methods or computed properties to your own structs/classes or other structs/classes

//: add a method to built-in Array struct

extension Array {
    mutating func moveItem(at currentIndex: Int, to newIndex: Int) {
        let item = self[currentIndex]
        if currentIndex < newIndex {
            for i in currentIndex..<newIndex {
                self[i] = self[i+1]
            }
        } else if currentIndex > newIndex {
            //for i in currentIndex.stride(to: newIndex, by: -1) {
            for i in stride(from: currentIndex, to: newIndex, by: -1) {
                self[i] = self[i-1]
            }
        }
        self[newIndex] = item
    }
}

var a = [1, 2, 3, 4, 5]
a.moveItem(at: 2, to: 4)


struct Person {

    var firstName: String = ""
    var lastName: String = ""

    // methods
    mutating func change(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//: common to implement protocols in an extension

extension Person: CustomStringConvertible {
    var description : String {
        return "\(firstName) \(lastName)"
    }
}

//: struct wihtout a constructor get a default constructor that takes each instance variable
let p = Person(firstName: "John", lastName: "Smith")
print(p)
