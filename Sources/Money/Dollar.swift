final class Dollar {
    public let amount: Int

    public init(amount: Int) {
        self.amount = amount
    }

    func times(multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }
}
