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
        
        if numberCompositionLabel.text == "0" {
            numberCompositionLabel.text = sender.number
        } else {
            // String
            guard let numberStringOfLabel = numberCompositionLabel.text, let clickedNumber = sender.number else {
                return
            }
            
            // String -> Number
            guard let numberValue = numberFormatter.number(from: numberStringOfLabel) else {
                return
            }
            
            // Number -> String
            let stringValue = numberValue.stringValue + clickedNumber
            
            // String -> Number
            guard let nsnumberValue = numberFormatter.number(from: stringValue) else {
                return
            }
            
            // String
            numberCompositionLabel.text = numberFormatter.string(from: nsnumberValue)
        }
        
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

