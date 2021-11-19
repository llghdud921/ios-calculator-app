//
//  CalculatorItem.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case substract = "−"
    case divide = "÷"
    case multiply = "×"
}

// MARK: - internal method

extension Operator {
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
}

// MARK: - private method

extension Operator {
    private func add(lhs: Double, rhs: Double) -> Double {
        let decimalResult: Decimal = Decimal(lhs) + Decimal(rhs)
        let result = Double(truncating: decimalResult as NSNumber)
        
        return result
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        let decimalResult: Decimal = Decimal(lhs) - Decimal(rhs)
        let result = Double(truncating: decimalResult as NSNumber)
        
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        let decimalResult: Decimal = Decimal(lhs) / Decimal(rhs)
        let result = Double(truncating: decimalResult as NSNumber)
        
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let decimalResult: Decimal = Decimal(lhs) * Decimal(rhs)
        let result = Double(truncating: decimalResult as NSNumber)
        
        return result
    }
}
