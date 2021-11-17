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
    }
    
    @IBOutlet var numberButtons: [NumberButton]!
    @IBOutlet var operatorButtons: [OperatorButton]!
    
    func setValueOnNumberButton() {
        numberButtons.forEach { $0.number = $0.titleLabel?.text }
    }
    
    func setValueOnOperatorButton() {
        operatorButtons.forEach { $0.operator = $0.titleLabel?.text }
    }
}

