//
//  ViewController.swift
//  CS193p_Calculator
//
//  Created by Nicholas Stroud on 10/21/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    
    @IBOutlet private weak var display: UILabel!
    private var userIsInTheMiddleOfTypingNumber = false
    
    
    @IBAction private func digitPressed(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber{
        let digitPressed=sender.currentTitle!
        display.text = display.text! + digitPressed
        } else {
            display.text = sender.currentTitle
        }
        userIsInTheMiddleOfTypingNumber = true
    }
    
    private var model = CalculatorModel()
    
    @IBAction func performOperation(_ sender: UIButton) {
        model.setQuantity(displayValue)
        if let operationSymbol = sender.currentTitle {
            model.performOperation(operationSymbol)
        }
        displayValue = model.result
    }
    
    
}

