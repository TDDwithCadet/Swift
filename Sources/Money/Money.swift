class Dollar {
    var amount: Int

    init(_ amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(self.amount * multiplier)
    }
}
