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
    
    // MARK: property
    @IBOutlet var numberButtons: [NumberButton]!
    @IBOutlet var operatorButtons: [OperatorButton]!
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBAction func changeNumberSign(_ sender: Any) {
        guard var numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        if numberOfLabel.hasPrefix("-") {
            numberOfLabel.removeFirst()
        } else {
            numberOfLabel = "-" + numberOfLabel
        }
        
        numberCompositionLabel.text = numberOfLabel
    }
    
    
    @IBAction func clickNumber(_ sender: NumberButton) {
        
        guard let numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        guard let numberOfButton = sender.number else {
            return
        }
        
        if numberOfLabel == "0" {
            numberCompositionLabel.text = sender.number
        } else {
            numberCompositionLabel.text = numberOfLabel + numberOfButton
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

