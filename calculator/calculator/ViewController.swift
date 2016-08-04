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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button actions
    
    @IBAction func numberClicked (_ sender: UIButton) {
    }
    @IBAction func operatorClicked (_ sender: UIButton) {
    }
    @IBAction func equalsClicked (_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

