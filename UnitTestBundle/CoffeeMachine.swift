struct CoffeeMachine {

    let drinkMaker: DrinkMaker

    func make() {
        drinkMaker.send("H::")
    }
}
