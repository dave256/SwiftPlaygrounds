// closures are reference types
// think of closures as anonymous functions
// similar to blocks in Objective-C

// functions takes a closure that we have named f
// the closure's type is a closure that takes a double and returns a double
// also pass
func derivative(f: (x: Double) -> Double, x: Double) -> Double {
    return (f(x: x + 0.00001) - f(x: x)) / 0.00001
}

print(derivative({ x in x * x}, x: 3))

// delcare MathFunction is a closure/function that takes a double and returns a double
typealias MathFunction = (x: Double) -> Double
func alternateDerivative(x: Double, f: MathFunction) -> Double {
    return (f(x: x + 0.00001) - f(x: x)) / 0.00001
}

// when closure is last parameter to the function, can write it after the function call
print(alternateDerivative(3) { x in x * x })
// can use $0, $1, $2, etc. to indicate the parameters in order
print(alternateDerivative(3) { $0 * $0})


// MARK: semi-practical example showing you can set a clossure variable and then call it later
typealias IntValueChangedClosure = (previousValue: Int, newValue: Int) -> Void

class ClosureExample {
    var xChangedClosure : IntValueChangedClosure? = nil
    var x: Int = 0 {
        didSet {
            print("did set")
            // use optional chaining so does not try to call when nil and crash
            xChangedClosure?(previousValue: oldValue, newValue: x)
        }
    }
}

var c = ClosureExample()
// xChangedClosure not set so just prints did set
c.x = 3

c.xChangedClosure = { (previousValue : Int, newValue: Int) in
    print("x changed from \(previousValue) to \(newValue)")
}
// closure is called for both these changes
c.x = 5
c.x = 42


