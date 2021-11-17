//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    // MARK: view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValueOnNumberButton()
    }
    
    @IBOutlet var numberButtons: [NumberButton]!
    @IBOutlet var operatorButtons: [OperatorButton]!
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBAction func clickNumber(_ sender: NumberButton) {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        
        var digit = 0
        
        if numberCompositionLabel.text == "0" {
            numberCompositionLabel.text = sender.number
        } else {
            // String
            guard var numberStringOfLabel = numberCompositionLabel.text else {
                return
            }
            
            guard let clickedNumber = sender.number, let clickedValue = Int(clickedNumber) else {
                return
            }
            
            if numberStringOfLabel.contains(".") {
                if numberStringOfLabel.hasSuffix(".") {
                    numberStringOfLabel.removeLast()
                    digit = -1
                } else {
                    let splitedNumber = numberStringOfLabel.split(separator: ".")
                    digit = ( splitedNumber[1].count * -1 ) - 1
                }
            }
            
            // String -> Number
            guard let numberValue = numberFormatter.number(from: numberStringOfLabel) else {
                return
            }
            
            var compositedValue: Double = Double.zero
            
            if digit < 0 {
                compositedValue = Double(truncating: numberValue) + Double(clickedValue) * (10 ** digit)
            } else {
                compositedValue = Double(truncating: numberValue) * 10 + Double(clickedValue)
            }
            
            numberCompositionLabel.text = numberFormatter.string(from: NSNumber(value: compositedValue))
        }
    }
    
    @IBAction func clickPointButton(_ sender: NumberButton) {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        
        //String
        guard let numberStringOfLabel = numberCompositionLabel.text else {
            return
        }
        
        // String
        numberCompositionLabel.text = numberStringOfLabel + "."
    }
}

// MARK: - internal method

extension ViewController {
    func setValueOnNumberButton() {
        numberButtons.forEach { $0.number = $0.titleLabel?.text }
    }
    
    func setValueOnOperatorButton() {
        operatorButtons.forEach { $0.operator = $0.titleLabel?.text }
    }
}

