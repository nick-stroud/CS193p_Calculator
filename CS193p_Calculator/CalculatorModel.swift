//
//  CalculatorModel.swift
//  CS193p_Calculator
//
//  Created by Nicholas Stroud on 10/21/16.
//  Copyright © 2016 Nicholas Stroud. All rights reserved.
//

import Foundation

class CalculatorModel{
    
    //Function gives calculator quantity to be used for operation
    //Must be called before performing operation
    func setQuantity(_ quantity: Double){
        currentQuantity = quantity
    }
    
    //Must be called before geting the result
    func performOperation(_:String) {
        
    }
    
    var result:Double {
        get{
            return currentQuantity!
        }
    }
    
    private var currentQuantity: Double?
    
}
