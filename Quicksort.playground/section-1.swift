// Playground - noun: a place where people can play


import XCPlayground

// function to allow visualizinng an array as a graph
func visualize<T>(data: [T], identifier: String) {
    for x in data {
        XCPlaygroundPage.currentPage.captureValue(x, withIdentifier: identifier)
        //XCPCaptureValue(identifier, value: x)
    }
}

func median3<T: Comparable>(inout items : [T], left: Int, right: Int) -> T {
    let center = (left + right) / 2

    // make left item less than center item
    if items[center] < items[left] {
        (items[left], items[center]) = (items[center], items[left])
    }

    // make left item less than right item
    if items[right] < items[left] {
        (items[left], items[right]) = (items[right], items[left])
    }

    // make center item less than right item
    if items[right] < items[center] {
        (items[center], items[right]) = (items[right], items[center])
    }

    // choose center item as pivot and put at position right-1
    (items[right-1], items[center]) = (items[center], items[right-1])
    return items[right - 1]
}

func quicksort<T: Comparable>(inout items: [T], left: Int, right: Int) {
    if left < right - 1 {
        let pivot = median3(&items, left: left, right: right)

        // visualize array
        visualize(items, identifier: "begin: pivot: \(pivot), left: \(left), right: \(right)")

        var i = left
        var j = right - 1

        while true {
            // move right until find item >= pivot
            i++
            while items[i] < pivot {
                i++
            }

            // move left until find item <= pivot
            j--
            while items[j] > pivot {
                j--
            }

            // swap item on left that is larger than pivot with 
            // item on right that is smaller than pivot
            if i < j {
                (items[i], items[j]) = (items[j], items[i])
            }
            else {
                break
            }
        }

        // put pivot item where it goes so now all items to the left of pivot are
        // less than or equal to it and all items to right of pivot are
        // greater than or equal to it
        (items[i], items[right-1]) = (items[right-1], items[i])

        // recursively sort left section
        quicksort(&items, left: left, right: i-1)

        // recursively sort right section
        quicksort(&items, left: i+1, right: right)

        // visualize array
        visualize(items, identifier: "end: pivot: \(pivot), left: \(left), right: \(right)")
    }
    // base case when left < right
    else if left < right {
        // swap items if necessary so they are in correct order
        if items[left] > items[right] {
            (items[left], items[right]) = (items[right], items[left])
        }
    }
    }

/*
var data = [Int]()
for i in 0..<20 {
    data.append(Int(arc4random()) % 100)
}
data
*/

// random data to sort
var data = [47, 31, 0, 30, 17, 83, 13, 12, 71, 33, 23, 38, 35, 48, 58, 88, 61, 90, 10, 21]


visualize(data, identifier: "Start")
// press the icon on far right of displayed numbers to visualize
quicksort(&data, left: 0, right: 19)
visualize(data, identifier: "End")

