import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10), five.times(2))
        XCTAssertEqual(Money.dollar(15), five.times(3))
    }

    func testEquality() throws {
        XCTAssertTrue(Money.dollar(5) == Money.dollar(5))
        XCTAssertFalse(Money.dollar(5) == Money.dollar(6))
        XCTAssertFalse(Money.franc(5) == Money.dollar(5))
    }

    func testCurrency() throws {
        XCTAssertEqual("USD", Money.dollar(1).currency)
        XCTAssertEqual("CHF", Money.franc(1).currency)
    }

    func testDifferentClassEquality() {
        XCTAssertTrue(Money(10, "CHF") == Money.franc(10))
    }

    func testSimpleAddition() {
        let five: Money = Money.dollar(5)
        let sum: Expression = five + five
        let bank: Bank = Bank()
        let reduced: Money = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(10), reduced)
    }

    func testPlusReturnsSum() throws {
        let five: Money = Money.dollar(5)
        let result: Expression = five + five
        guard let sum: Sum = result as? Sum else {
            XCTAssertThrowsError("ERROR")
            return
        }
        XCTAssertEqual(five, sum.augend)
        XCTAssertEqual(five, sum.addend)
    }

    func testReduceSum() {
        let sum: Expression = Sum(augend: Money.dollar(3), addend: Money.dollar(4))
        let bank: Bank = Bank()
        let result: Money = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(7), result)
    }

    func testReduceMoney() {
        let bank: Bank = Bank()
        let result: Money = bank.reduce(source: Money.dollar(1), to: "USD")
        XCTAssertEqual(Money.dollar(1), result)
    }

    func testReduceMoneyDifferentCurrency() {
        let bank: Bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let result: Money = bank.reduce(source: Money.franc(2), to: "USD")
        XCTAssertEqual(Money.dollar(1), result)
    }

    func testIndentityRate() {
        XCTAssertEqual(1, Bank().rate(from: "USD", to: "USD"))
    }

    func testMixedAddition() {
        let fivebucks: Money = Money.dollar(5)
        let tenFrancs: Money = Money.franc(10)
        let bank: Bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let result: Money = bank.reduce(source: fivebucks + tenFrancs, to: "USD")
        XCTAssertEqual(Money.dollar(10), result)
    }
}
