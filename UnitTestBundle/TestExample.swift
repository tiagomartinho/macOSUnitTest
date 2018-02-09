import XCTest

class TestExample: XCTestCase {

    var sut: SystemUnderTest!

    override func setUp() {
        super.setUp()
        sut = SystemUnderTest()
    }
    
    func testExample() {
        let input = """
                    3
                    ---+-++- 3
                    +++++ 4
                    -+-+- 4
                    """

        let output = sut.methodToTest(input)

        let expected = """
                        Case #1: 3
                        Case #2: 0
                        Case #3: IMPOSSIBLE
                        """
        XCTAssertEqual(expected, output)
    }
}

class SystemUnderTest {
    func methodToTest(_ input: String) -> String {
        let inputs = input.split(separator: "\n").dropFirst()
        var result = ""
        for (index, _) in inputs.enumerated() {
            result.append("Case #\(index + 1): ")
            if index < inputs.count - 1 {
                result.append("\n")
            }
        }
        return result
    }
}
