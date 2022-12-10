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
        let sum: Money = Money.dollar(5) + Money.dollar(5)
        XCTAssertEqual(Money.dollar(10), sum)
    }
}
