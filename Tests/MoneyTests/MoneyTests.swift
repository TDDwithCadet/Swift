import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five = Dollar(amount: 5)
        five.times(multiplier: 2)
        XCTAssertEqual(10, five.amount)
    }
}
