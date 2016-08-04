//
//  StructsEnums.swift
//  calculator
//
//  Created by Gibbonsoft Limited on 04/08/2016.
//  Copyright © 2016 feliun. All rights reserved.
//

import Foundation


enum Operator:String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState:String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
