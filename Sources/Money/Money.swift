class Dollar {
    private var amount: Int

    init(_ amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(self.amount * multiplier)
    }
}

extension Dollar: Equatable {
    public static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
        return lhs.amount == rhs.amount
    }
}
