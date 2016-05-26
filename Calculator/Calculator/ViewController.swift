//
//  ViewController.swift
//  Calculator
//
//  Created by Vitaliy Kvas on 5/25/16.
//  Copyright © 2016 Vitaliy Kvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
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
        firstOperand = currentInput
        stillTyping = false
    }
}

