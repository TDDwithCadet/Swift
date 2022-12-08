import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five = Dollar(amount: 5)
        var product = five.times(multiplier: 2)
        XCTAssertEqual(10, product.amount)
        product = five.times(multiplier: 3)
        XCTAssertEqual(15, product.amount)
    }
}
