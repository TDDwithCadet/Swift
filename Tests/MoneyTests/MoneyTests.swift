import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five = Dollar(amount: 5)
        XCTAssertEqual(Dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Dollar(amount: 15), five.times(multiplier: 3))
    }

    func testEquality() throws {
        XCTAssertTrue(Franc(amount: 5).equals(obj: Franc(amount: 5)))
        XCTAssertFalse(Franc(amount: 5).equals(obj: Franc(amount: 6)))
    }

    func testFrancMultiplication() throws {
        let five = Franc(amount: 5)
        XCTAssertEqual(Franc(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Franc(amount: 15), five.times(multiplier: 3))
    }
}
