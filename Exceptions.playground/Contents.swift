//: Playground - noun: a place where people can play

public enum ExampleError: Error {
    case isNegative(String)
    case isZero(String)
}

//: must mark a function with "throws" if it may throw

func sampleFuction(x: Int) throws -> Int {
    if x < 0 {
        throw ExampleError.isNegative("\(x) is less than zero")
    } else if x == 0 {
        throw ExampleError.isZero("\(x) is zero")
    }
    return x
}

//: must call a function with try!, try? or try if it is marked throws

//: this would crash

//: try! sampleFuction(x: -3)

//: can use try? to get optional if functions throws
if let y = try? sampleFuction(x: -3) {
    print("ok")
} else {
    print("error")
}

//: use do/catch with try to catch the error

do {
    let y = try sampleFuction(x: -3)
    print(y)
} catch ExampleError.isNegative(let msg) {
    print(msg)
} catch ExampleError.isZero(let msg) {
    print(msg)
}

do {
    let y = try sampleFuction(x: 0)
    print(y)
} catch ExampleError.isNegative(let msg) {
    print(msg)
} catch ExampleError.isZero(let msg) {
    print(msg)
}

do {
    let y = try sampleFuction(x: 1)
    print(y)
} catch ExampleError.isNegative(let msg) {
    print(msg)
} catch ExampleError.isZero(let msg) {
    print(msg)
}
