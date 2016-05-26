//
//  ViewController.swift
//  Calculator
//
//  Created by Vitaliy Kvas on 5/25/16.
//  Copyright © 2016 Vitaliy Kvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.componentsSeparatedByString(".")
            
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }

    @IBAction func numberPressed(sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text?.characters.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        }
        else
        {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandSignPressed(sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    
    @IBAction func equalitySignPressed(sender: UIButton) {
        if stillTyping{
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
            case "+": operateWitthTwoOperant {$0 + $1}
            case "-": operateWitthTwoOperant {$0 - $1}
            case "×": operateWitthTwoOperant {$0 * $1}
            case "÷": operateWitthTwoOperant {$0 / $1}
            default: break;
        }
    }
    
    func operateWitthTwoOperant(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentageButtonpressed(sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            currentInput = firstOperand * currentInput / 100
        }
        
        stillTyping = false
    }
    
    @IBAction func squareRootButtonPressed(sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func dotButtonPressed(sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
            stillTyping = true
        }
    }
}

