protocol Expression {
}

class Money: Expression {
    fileprivate var amount: Int
    let currency: String

    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currency = currency
    }

    func times(_ multiplier: Int) -> Money {
        return Money(self.amount * multiplier, currency)
    }
}

class Bank {
    func reduce(_ source: Expression, _ to: String) -> Money {
        return Money.dollar(10)
    }
}

class Sum: Expression {
    let augend: Money
    let addend: Money

    init(augend: Money, addend: Money) {
        self.augend = augend
        self.addend = addend
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }

    public static func +(lhs: Money, rhs: Money) -> Expression {
        return Sum(augend: lhs, addend: rhs)
    }

    public static func dollar(_ amount: Int) -> Money {
        return Dollar(amount, "USD")
    }

    public static func franc(_ amount: Int) -> Money {
        return Franc(amount, "CHF")
    }
}

class Dollar: Money {}

class Franc: Money {}
