//
//  Bank.swift
//  
//
//  Created by jun on 2022/12/11.
//

class Bank {
    private var rates: [Pair: Int] = [:]

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

