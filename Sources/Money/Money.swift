class Money {
    fileprivate var amount: Int

    init(_ amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Money {
        return Money(self.amount * multiplier)
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }

    public static func dollar(_ amount: Int) -> Dollar {
        return Dollar(amount)
    }

    public static func franc(_ amount: Int) -> Franc {
        return Franc(amount)
    }

    public class func currency() -> String {
        return "Money"
    }
}

class Dollar: Money {
    override func times(_ multiplier: Int) -> Money {
        return Dollar(self.amount * multiplier)
    }

    func currency() -> String {
        return "USD"
    }
}

class Franc: Money {
    override func times(_ multiplier: Int) -> Money {
        return Franc(self.amount * multiplier)
    }

    func currency() -> String {
        return "CHF"
    }
}
