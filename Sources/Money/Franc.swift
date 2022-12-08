class Franc {
    private let amount: Int

    public init(amount: Int) {
        self.amount = amount
    }

    func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }

    func equals(obj: AnyObject) -> Bool {
        guard let franc = obj as? Franc else {
            return false
        }
        return self.amount == franc.amount
    }
}

extension Franc : Equatable {
    public static func ==(lhs: Franc, rhs: Franc) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
