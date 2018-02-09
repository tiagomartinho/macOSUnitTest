import XCTest

class TestExample: XCTestCase {

    var sut: SystemUnderTest!

    override func setUp() {
        super.setUp()
        sut = SystemUnderTest()
    }
    
    func DISABLE_testExample() {
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
        for (index, line) in inputs.enumerated() {
            let pancakes = String(line.split(separator: " ").first!)
            let flipper = Int(line.split(separator: " ").last!)!
            let caseResult = pancakeFlipper(pancakes, flipper)
            result.append("Case #\(index + 1): \(caseResult)")
            if index < inputs.count - 1 {
                result.append("\n")
            }
        }
        return result
    }
}

func pancakeFlipper(_ pancakes: String, _ flipper: Int) -> String {
    return "IMPOSSIBLE"
}
