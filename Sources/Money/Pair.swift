//
//  Pair.swift
//  
//
//  Created by jun on 2022/12/11.
//

struct Pair {
    let from: String
    let to: String

    init(from: String, to: String) {
        self.from = from
        self.to = to
    }
}

extension Pair: Hashable {
    static func ==(lhs: Pair, rhs: Pair) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }

    func hashCode() -> Int {
        return 0
    }
}
