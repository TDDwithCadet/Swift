final class Dollar {
    public var amount: Int

    public init(amount: Int) {
        self.amount = amount
    }

    func times(multiplier: Int) {
        self.amount *= multiplier
    }
}
