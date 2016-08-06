//
//  ViewController.swift
//  calculator
//
//  Created by Gibbonsoft Limited on 04/08/2016.
//  Copyright © 2016 feliun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var currentOperation:Operator = Operator.nothing
    var calcState:CalculationState = CalculationState.enteringNum
    var firstOperator = 0
    var secondOperator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button actions
    
    @IBAction func numberClicked (_ sender: UIButton) {
        if (calcState == CalculationState.enteringNum) {
            self.firstOperator = self.firstOperator * 10 + sender.tag
            resultLabel.text = String(self.firstOperator)
        } else if (calcState == CalculationState.newNumStarted) {
            self.secondOperator = self.secondOperator * 10 + sender.tag
            resultLabel.text = String(self.secondOperator)
        }
    }
    @IBAction func operatorClicked (_ sender: UIButton) {
        switch(sender.tag) {
        case 10: self.currentOperation = Operator.add
                    break
        case 11: self.currentOperation = Operator.subtract
            break
        case 12: self.currentOperation = Operator.times
            break
        case 13: self.currentOperation = Operator.divide
            break
        default: self.currentOperation = Operator.nothing
        }
        self.calcState = CalculationState.newNumStarted
    }
    @IBAction func equalsClicked (_ sender: UIButton) {
        var result = 0
        switch(self.currentOperation) {
        case Operator.add: result = self.firstOperator + self.secondOperator
            break
        case Operator.subtract: result = self.firstOperator - self.secondOperator
            break
        case Operator.times: result = self.firstOperator * self.secondOperator
            break
        case Operator.divide: result = self.firstOperator / self.secondOperator
            break
        default: break
        }
        resultLabel.text = String(result)
        self.firstOperator = 0
        self.secondOperator = 0
        self.calcState = CalculationState.enteringNum
        self.currentOperation = Operator.nothing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

