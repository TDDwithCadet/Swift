class Dollar {
    private let amount: Int

    public init(amount: Int) {
        self.amount = amount
    }

    func times(multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }

    func equals(obj: AnyObject) -> Bool {
        guard let dollar = obj as? Dollar else {
            return false
        }
        return self.amount == dollar.amount
    }
}

extension Dollar : Equatable {
    public static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
