//: ## Extensions

//: can add methods or computed properties to your own structs/classes or other structs/classes

//: add a method to built-in Array struct

extension Array {
    mutating func moveItemAtIndex(_ currentIndex: Int, toIndex endIndex: Int) {
        let item = self[currentIndex]
        if currentIndex < endIndex {
            for i in currentIndex..<endIndex {
                self[i] = self[i+1]
            }
        } else if currentIndex > endIndex {
            //for i in currentIndex.stride(to: endIndex, by: -1) {
            for i in stride(from: currentIndex, to: endIndex, by: -1) {
                self[i] = self[i-1]
            }
        }
        self[endIndex] = item
    }
}

var a = [1, 2, 3, 4, 5]
a.moveItemAtIndex(2, toIndex: 4)


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