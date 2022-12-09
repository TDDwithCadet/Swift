//
//  Money.swift
//  
//
//  Created by jun on 2022/12/09.
//

import Foundation

class Money {
    // Swift에서는 protected라는 키워드가 존재하지 않음
    // 대신 파일 내부에서만 접근할 수 있는 fileprivate 사용
    fileprivate var amount: Int

    init(amount: Int) {
        self.amount = amount
    }
}

class Dollar: Money {

    override public init(amount: Int) {
        super.init(amount: amount)
    }

    func times(multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }
}

class Franc: Money {

    override public init(amount: Int) {
        super.init(amount: amount)
    }

    func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
