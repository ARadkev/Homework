//
//  ViewController.swift
//  14.08.2022 (Homework.calculator)
//
//  Created by 100nout on 14.08.22.
//

import UIKit

//class Calculation {
//    var counter: Int
//    init(counter: Int) {
//        self.counter = 0
//    }
//}

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var firstNumber: Double = 0
    var action: Int = 0
    var mathOperator: Bool = false
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var acButton: UIButton!
    @IBOutlet var plusMinusButton: UIButton!
    @IBOutlet var percentButton: UIButton!
    @IBOutlet var devisionButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var decimalButton: UIButton!
    @IBOutlet var equalButton: UIButton!
    
    @IBAction func clearButton(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 10 && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 && sender.tag != 18 {
            firstNumber = Double(resultLabel.text!)!
            
            if sender.tag == 13 { // Divide
                
            }
            else if sender.tag == 14 { // Multiply
                
            }
            else if sender.tag == 15 { // Subtract
                
            }
            else if sender.tag == 16 { // Add
                
            }
            
            action = sender.tag
            mathOperator = true
        }
        else if sender.tag == 17 { // Equals
            if action == 13 {
                resultLabel.text = String(firstNumber / numberOnScreen)
            }
            else if action == 14 {
                resultLabel.text = String(firstNumber * numberOnScreen)
            }
            else if action == 15 {
                resultLabel.text = String(firstNumber - numberOnScreen)
            }
            else if action == 16 {
                resultLabel.text = String(firstNumber + numberOnScreen)
            }
        }
        else if sender.tag == 10 {
            resultLabel.text = ""
            firstNumber = 0
            numberOnScreen = 0
            action = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        acButton.layer.cornerRadius = 49
        plusMinusButton.layer.cornerRadius = 49
        percentButton.layer.cornerRadius = 49
        devisionButton.layer.cornerRadius = 49
        sevenButton.layer.cornerRadius = 49
        eightButton.layer.cornerRadius = 49
        nineButton.layer.cornerRadius = 49
        multiplyButton.layer.cornerRadius = 49
        fourButton.layer.cornerRadius = 49
        fiveButton.layer.cornerRadius = 49
        sixButton.layer.cornerRadius = 49
        minusButton.layer.cornerRadius = 49
        oneButton.layer.cornerRadius = 49
        twoButton.layer.cornerRadius = 49
        threeButton.layer.cornerRadius = 49
        plusButton.layer.cornerRadius = 49
        zeroButton.layer.cornerRadius = 49
        decimalButton.layer.cornerRadius = 49
        equalButton.layer.cornerRadius = 49
        
//        let buttonArray = [acButton, plusMinusButton, percentButton, devisionButton]
//
//        for button in buttonArray {
//            view.layer.cornerRadius = 53
//        }
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
//        let number = sender.currentTitle!
//        resultLabel.text = resultLabel.text! + number
            
        if mathOperator == true {
                resultLabel.text = String(sender.tag)
                mathOperator = false
            } else {
                resultLabel.text = resultLabel.text! + String(sender.tag)
            }
            numberOnScreen = Double(resultLabel.text!)!
        
    }
}

