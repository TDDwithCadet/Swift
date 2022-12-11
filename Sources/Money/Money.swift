protocol Expression {
    func reduce(bank: Bank, to: String) -> Money
    func plus(addend: Expression) -> Expression
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

    func plus(addend: Expression) -> Expression {
        return Sum(augend: self, addend: addend as! Money)
    }
}

class Bank {
    var rates: [Pair: Int] = [:]

    func reduce(source: Expression, to: String) -> Money {
        return source.reduce(bank: self, to: to)
    }

    func rate(from: String, to: String) -> Int {
        if from == to {
            return 1
        }
        return rates[Pair(from: from, to: to)] ?? 1
    }

    func addRate(from: String, to: String, rate: Int) {
        rates[Pair(from: from, to: to)] = rate
    }
}

class Sum: Expression {
    let augend: Expression
    let addend: Expression

    init(augend: Expression, addend: Expression) {
        self.augend = augend
        self.addend = addend
    }

    func reduce(bank: Bank, to: String) -> Money {
        let amount: Int = self.augend.reduce(bank: bank, to: to).amount + self.addend.reduce(bank: bank, to: to).amount
        return Money(amount, to)
    }

    func plus(addend: Expression) -> Expression {
        return Sum(augend: self, addend: addend)
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
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
