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
    
    @IBOutlet private weak var descriptionDisplay: UILabel!
    @IBOutlet private weak var display: UILabel!
    private var userIsInTheMiddleOfTypingNumber = false
    private var userIsTypingAfterTheDecimal = false
    
    
    @IBAction private func digitPressed(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber{
            let digitPressed=sender.currentTitle!
            if digitPressed != "." {
                            display.text = display.text! + digitPressed
            } else if !userIsTypingAfterTheDecimal {
                display.text = display.text! + digitPressed
                userIsTypingAfterTheDecimal = true
            }
        } else {
            if sender.currentTitle == "." {
                userIsTypingAfterTheDecimal = true
                display.text = "0."
            } else {
                display.text = sender.currentTitle
            }
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
        self.descriptionText = model.description
        userIsInTheMiddleOfTypingNumber = false
        userIsTypingAfterTheDecimal = false
    }
    
    private var descriptionText: String {
        get{
            if (descriptionDisplay.text != nil) {
                            return descriptionDisplay.text!
            }else {
                return "empty"
            }
        }
        set{
            var trailingDescriptor = "?"
            if model.isPartialResult {
                trailingDescriptor = "..."
            } else {
                trailingDescriptor = "="
            }
            descriptionDisplay.text = newValue.appending(trailingDescriptor)
        }
    }
    
    private var storedProgram: CalculatorModel.PropertyList?
    @IBAction func save() {
        storedProgram = model.program
    }
    
    @IBAction func retore() {
        if storedProgram != nil {
            model.program = storedProgram!
            displayValue = model.result
        }
    }
    
    @IBAction private func Clear() {
        model.clear()
        self.display.text = "0"
        self.descriptionDisplay.text = "---"
        userIsTypingAfterTheDecimal = false
        userIsInTheMiddleOfTypingNumber = false
    }
}

