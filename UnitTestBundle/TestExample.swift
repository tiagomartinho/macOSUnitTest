import XCTest

class TestExample: XCTestCase {

    func testLast() {
        XCTAssertEqual(8,  List(1, 1, 2, 3, 5, 8).last)
    }

    func testPennultimate() {
        XCTAssertEqual(5,  List(1, 1, 2, 3, 5, 8).pennultimate)
    }

    func testSubscript() {
        XCTAssertEqual(3,  List(1, 1, 2, 3, 5, 8)[3])
    }

    func testLength() {
        XCTAssertEqual(6,  List(1, 1, 2, 3, 5, 8).length)
        XCTAssertEqual(0,  List<Int>().length)
        XCTAssertEqual(1,  List(1).length)
    }
}

class Node<T> {
    let value: T
    var next: Node?
    init(_ value: T) {
        self.value = value
    }
}

class List<T> {

    var head: Node<T>?

    var lastNode: Node<T>? {
        guard var node = head else {
            return nil
        }

        while let next = node.next {
            node = next
        }
        return node
    }

    var last: T? {
        return lastNode?.value
    }

    convenience init(_ values: T...) {
        self.init(values)
    }

    init(_ values: [T]) {
        if values.isEmpty { return }
        for element in values {
            self.append(element)
        }
    }

    func append(_ value: T) {
        let newNode = Node(value)
        self.append(newNode)
    }

    func append(_ node: Node<T>) {
        let newNode = node
        if let lastNode = lastNode {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    subscript(index: Int) -> T {
        get {
            var current = head
            for _ in 1...index {
                current = current?.next
            }
            return current!.value
        }
        set(newValue) {
        }
    }
}

extension List {
    var pennultimate: T? {
        guard var node = head else {
            return nil
        }

        while let next = node.next?.next {
            node = next
        }
        return node.value
    }
}

extension List {
    var length: Int {
        guard var node = head else {
            return 0
        }

        var lenght = 1

        while let next = node.next {
            node = next
            lenght += 1
        }
        return lenght
    }
}
