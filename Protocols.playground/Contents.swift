protocol Drawable {
    func draw()
    var area: Double { get }
}

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

extension Point: Drawable {
    func draw() {
        print("this method would draw the point on the screen")
    }

    var area: Double {
        return 0.0
    }
}

struct Square {
    var topLeft = Point()
    var length = 0.0
}

extension Square: Drawable {
    func draw() {
        print("this method would draw the square on the screen")
    }

    var area: Double {
        return length * length
    }
}

let p = Point(x: 2, y: 3)
p.draw()
print(p.area)

let s = Square(topLeft: Point(x: 2, y: 3), length: 4)
s.draw()
print(s.area)

