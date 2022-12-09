import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five: Money = Money.dollar(5)
        XCTAssertEqual(Dollar(10), five.times(2))
        XCTAssertEqual(Dollar(15), five.times(3))
    }

    func testEquality() throws {
        XCTAssertTrue(Dollar(5) == Dollar(5))
        XCTAssertFalse(Dollar(5) == Dollar(6))
        XCTAssertTrue(Franc(5) == Franc(5))
        XCTAssertFalse(Franc(5) == Franc(6))
        XCTAssertFalse(Franc(5) == Dollar(5))
    }

    func testFrancMultiplication() {
        let five: Money = Money.franc(5)
        XCTAssertEqual(Franc(10), five.times(2))
        XCTAssertEqual(Franc(15), five.times(3))
    }
}
