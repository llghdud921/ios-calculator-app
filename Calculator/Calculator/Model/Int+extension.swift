//
//  Int+extension.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/17.
//

import Foundation

infix operator ** : AdditionPrecedence

extension Int {
    static func ** (lhs: Int, rhs: Int) -> Double {
        let floatResult = pow(Float(lhs), Float(rhs))
        let result = Double(floatResult)
        return result
    }
}
