//: ## Closures (anonymous functions)
//: closures are reference types

//: functions takes a closure that we have named f

//: the closure's type is a closure that takes a double and returns a double
func derivative(f: (Double) -> Double, x: Double) -> Double {
    return (f(x + 0.00001) - f(x)) / 0.00001
}

//: use $0, $1, $2, etc. for parameters

print(derivative(f: { $0 * $0 }, x: 3))

//: delcare MathFunction as a closure/function that takes a double and returns a double
typealias MathFunction = (Double) -> Double
func alternateDerivative(x: Double, f: MathFunction) -> Double {
    return (f(x + 0.00001) - f(x)) / 0.00001
}

//: when closure is last parameter to the function, can write it after the function call
print(alternateDerivative(x: 3) { x in x * x })
print(alternateDerivative(x: 3) { $0 * $0})


//: ## semi-practical example showing you can set a closure variable and then call it later

//: closures cannot have named parameters so must use _

typealias IntValueChangedClosure = (_ previousValue: Int, _ newValue: Int) -> Void

class ClosureExample {
    var xChangedClosure : IntValueChangedClosure? = nil
    var x: Int = 0 {
        didSet {
            print("did set")
            // use optional chaining so does not try to call when nil and crash
            xChangedClosure?(oldValue, x)
        }
    }
}

var c = ClosureExample()
// xChangedClosure not set so just prints did set
c.x = 3

//: note syntax: { (param, param) in closure-body }

c.xChangedClosure = { (previousValue : Int, newValue: Int) in
    print("x changed from \(previousValue) to \(newValue)")
}

//: closure is called for both these changes
c.x = 5
c.x = 42


