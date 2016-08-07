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
    var firstValue = 0
    var secondValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button actions
    
    @IBAction func numberClicked (_ sender: UIButton) {
        if (calcState == CalculationState.enteringNum) {
            self.firstValue = self.firstValue * 10 + sender.tag
            resultLabel.text = String(self.firstValue)
        } else if (calcState == CalculationState.newNumStarted) {
            self.secondValue = self.secondValue * 10 + sender.tag
            resultLabel.text = String(self.secondValue)
        }
    }
    @IBAction func operatorClicked (_ sender: UIButton) {
        var operatorByTagCode: [Int: Operator] = [ 10: Operator.add, 11: Operator.subtract, 12: Operator.times, 13: Operator.divide ]
        self.currentOperation = Operator.nothing
        if let operation = operatorByTagCode[sender.tag] {
            self.currentOperation = operation
        }
        self.calcState = CalculationState.newNumStarted
    }
    
    @IBAction func equalsClicked (_ sender: UIButton) {
        var result = 0
        switch(self.currentOperation) {
            case Operator.add: result = self.firstValue + self.secondValue
                break
            case Operator.subtract: result = self.firstValue - self.secondValue
                break
            case Operator.times: result = self.firstValue * self.secondValue
                break
            case Operator.divide: result = self.firstValue / self.secondValue
                break
            default: break
        }
        resultLabel.text = String(result)
        self.firstValue = result
        self.secondValue = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

