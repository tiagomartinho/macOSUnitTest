import XCTest

class TestCoffeeMachine: XCTestCase {

    func testMakesChocolateWithNoSugarAndThereforeNoStick() {
        coffeeMachine.make()

        XCTAssertEqual("H::", drinkMaker.lastInstruction)
    }

    // MARK : Supporting Tests
    
    private var coffeeMachine: CoffeeMachine!
    private var drinkMaker: SpyDrinkMaker!

    override func setUp() {
        super.setUp()
        drinkMaker = SpyDrinkMaker()
        coffeeMachine = CoffeeMachine(drinkMaker: drinkMaker)
    }

    class SpyDrinkMaker: DrinkMaker {

        var lastInstruction: String!

        func send(_ instruction: String) {
            lastInstruction = instruction
        }
    }
}
