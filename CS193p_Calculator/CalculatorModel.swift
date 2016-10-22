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
    
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "-" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    //Must be called before geting the result
    func performOperation(_ symbol:String) {
        if let operation = operations[symbol]{
            switch operation {
            case Operation.Constant(let value):
                currentQuantity = value
            case Operation.UnaryOperation(let function):
                currentQuantity = function(currentQuantity)
            case Operation.BinaryOperation(let function):
                executePendingBinaryOperatino()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstQuantity: currentQuantity)
            case Operation.Equals:
                executePendingBinaryOperatino()
                
            }
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private func executePendingBinaryOperatino() {
        if pending != nil {
            currentQuantity = pending!.binaryFunction(pending!.firstQuantity, currentQuantity)
            pending = nil
        }
    }
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstQuantity: Double
    }
    
    var result: Double {
        get{
                return currentQuantity
            
        }
    }
    
        private var currentQuantity = 0.0
    
}
