//
//  ViewController.swift
//  CS193p_Calculator
//
//  Created by Nicholas Stroud on 10/21/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingNumber = false
    
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber{
        let digitPressed=sender.currentTitle!
        display.text = display.text! + digitPressed
        } else {
            display.text = sender.currentTitle
        }
        userIsInTheMiddleOfTypingNumber = true
    }
    
}

