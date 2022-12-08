import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five = Dollar(amount: 5)
        XCTAssertEqual(Dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Dollar(amount: 15), five.times(multiplier: 3))
    }

    func testEquality() throws {
        XCTAssertTrue(Dollar(amount: 5).equals(obj: Dollar(amount: 5)))
        XCTAssertFalse(Dollar(amount: 5).equals(obj: Dollar(amount: 6)))
    }
}
