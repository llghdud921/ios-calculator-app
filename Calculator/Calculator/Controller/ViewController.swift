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
    
    // MARK: property
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBAction func clickOperator(_ sender: UIButton) {
        guard let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        operatorSettingLabel.text = operatorOfButton
    }
    
    
    @IBAction func changeNumberSign(_ sender: UIButton) {
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
    
    @IBAction func clickNumber(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if numberOfLabel == "0" {
            numberCompositionLabel.text = numberOfButton
        } else {
            numberCompositionLabel.text = numberOfLabel + numberOfButton
        }
    }
    
}


