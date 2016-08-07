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
    
    func updateView(number: Int) {
        resultLabel.text = String(number)
    }
    
    func displayOperator(op: Operator) {
        var operatorByName: [Operator: String] = [ Operator.add: "+", Operator.subtract: "-", Operator.times: "*", Operator.divide: "/", Operator.nothing: "" ]
        resultLabel.text = resultLabel.text! + " " + operatorByName[op]!
    }
    
    @IBAction func numberClicked (_ sender: UIButton) {
        let pressedDigit = sender.tag
        if (calcState == CalculationState.enteringNum) {
            self.firstValue = self.firstValue * 10 + pressedDigit
            updateView(number: self.firstValue)
        } else if (calcState == CalculationState.newNumStarted) {
            self.secondValue = self.secondValue * 10 + pressedDigit
            updateView(number: self.secondValue)
        }
    }
    @IBAction func operatorClicked (_ sender: UIButton) {
        var operatorByTagCode: [Int: Operator] = [ 10: Operator.add, 11: Operator.subtract, 12: Operator.times, 13: Operator.divide ]
        self.currentOperation = Operator.nothing
        if let operation = operatorByTagCode[sender.tag] { self.currentOperation = operation }
        self.calcState = CalculationState.newNumStarted
        displayOperator(op: self.currentOperation)
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
        updateView(number: result)
        self.firstValue = result
        self.secondValue = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

