class Money {
    fileprivate var amount: Int

    init(_ amount: Int) {
        self.amount = amount
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
}

class Dollar: Money {
    func times(_ multiplier: Int) -> Money {
        return Dollar(self.amount * multiplier)
    }
}

class Franc: Money {
    func times(_ multiplier: Int) -> Money {
        return Franc(self.amount * multiplier)
    }
}
