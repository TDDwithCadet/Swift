import XCTest
@testable import Money

final class MoneyTests: XCTestCase {
    func testMultiplication() throws {
        let five = Dollar(5)
        var product = five.times(2)
        XCTAssertEqual(10, product.amount)
        product = five.times(3)
        XCTAssertEqual(15, product.amount)
    }

    func testEquality() throws {
        XCTAssertTrue(Dollar(5) == Dollar(5))
    }
}
