protocol Expression {
    func reduce(bank: Bank, to: String) -> Money
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

    func reduce(bank: Bank, to: String) -> Money {
        let rate = bank.rate(from: self.currency, to: to)
        return Money(self.amount / rate, to)
    }
}

class Bank {
    func reduce(source: Expression, to: String) -> Money {
        return source.reduce(bank: self, to: to)
    }

    func rate(from: String, to: String) -> Int {
        return from == "CHF" && to == "USD" ? 2 : 1
    }
}

class Sum: Expression {
    let augend: Money
    let addend: Money

    init(augend: Money, addend: Money) {
        self.augend = augend
        self.addend = addend
    }

    func reduce(bank: Bank, to: String) -> Money {
        let amount: Int = self.augend.amount + self.addend.amount
        return Money(amount, to)
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
