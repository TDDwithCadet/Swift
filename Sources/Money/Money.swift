class Money {
    fileprivate var amount: Int
    let currency: String

    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currency = currency
    }

    func times(_ multiplier: Int) -> Money {
        return Money(self.amount * multiplier, "")
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }

    public static func dollar(_ amount: Int) -> Dollar {
        return Dollar(amount, "USD")
    }

    public static func franc(_ amount: Int) -> Franc {
        return Franc(amount, "CHF")
    }
}

class Dollar: Money {
    override func times(_ multiplier: Int) -> Money {
        return Money.dollar(self.amount * multiplier)
    }
}

class Franc: Money {
    override func times(_ multiplier: Int) -> Money {
        return Money.franc(self.amount * multiplier)
    }
}
