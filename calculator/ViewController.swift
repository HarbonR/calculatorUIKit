//
//  ViewController.swift
//  calculator
//
//  Created by  Pavel on 24.07.2024.
//

import UIKit

class ViewController: UIViewController {

    var variableAnsver : Double = 0
    var operation : Int = 0
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBAction func buttonPlusAction(_ sender: Any) {
        operation = 1
        buttonPlus.backgroundColor = UIColor.purple
        buttonMinus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMultiply.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonDivide.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
    }
    @IBOutlet weak var buttonMinus: UIButton!
    @IBAction func buttonMinusAction(_ sender: Any) {
        operation = 2
        buttonPlus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMinus.backgroundColor = UIColor.purple
        buttonMultiply.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonDivide.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
    }
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBAction func buttonMultiplyAction(_ sender: Any) {
        operation = 3
        buttonPlus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMinus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMultiply.backgroundColor = UIColor.purple
        buttonDivide.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
    }
    @IBOutlet weak var buttonDivide: UIButton!
    @IBAction func buttonDivideAction(_ sender: Any) {
        operation = 4
        buttonPlus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMinus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMultiply.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonDivide.backgroundColor = UIColor.purple
    }
    @IBOutlet weak var buttonOne: UIButton!
    @IBAction func buttonOneAction(_ sender: Any) {
        performOperation(numButton: 1)
    }
    @IBOutlet weak var buttonTwo: UIButton!
    @IBAction func buttonTwoAction(_ sender: Any) {
        performOperation(numButton: 2)
    }
    @IBOutlet weak var buttonThree: UIButton!
    @IBAction func buttonThreeAction(_ sender: Any) {
        performOperation(numButton: 3)
    }
    @IBOutlet weak var buttonFour: UIButton!
    @IBAction func buttonfourAction(_ sender: Any) {
        performOperation(numButton: 4)
    }
    @IBOutlet weak var buttonFive: UIButton!
    @IBAction func buttonFiveAction(_ sender: Any) {
        performOperation(numButton: 5)
    }
    @IBOutlet weak var buttonSix: UIButton!
    @IBAction func buttonSixAction(_ sender: Any) {
        performOperation(numButton: 6)
    }
    @IBOutlet weak var buttonSeven: UIButton!
    @IBAction func buttonSevenAction(_ sender: Any) {
        performOperation(numButton: 7)
    }
    @IBOutlet weak var buttonEight: UIButton!
    @IBAction func buttonEightAction(_ sender: Any) {
        performOperation(numButton: 8)
    }
    @IBOutlet weak var buttonNine: UIButton!
    @IBAction func buttonNineAction(_ sender: Any) {
        performOperation(numButton: 9)
    }
    @IBOutlet weak var buttonZero: UIButton!
    @IBAction func buttonZeroAction(_ sender: Any) {
        performOperation(numButton: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    func performOperation(numButton : Double){
        switch operation{
        case 1 :
            answer.text = String(variableAnsver + numButton)
            variableAnsver = variableAnsver + numButton
            operation = 0
            buttonPlus.backgroundColor = UIColor.clear
        case 2 :
            answer.text = String(variableAnsver - numButton)
            variableAnsver = variableAnsver - numButton
            operation = 0
            buttonMinus.backgroundColor = UIColor.clear
        case 3 :
            answer.text = String(variableAnsver * numButton)
            variableAnsver = variableAnsver * numButton
            operation = 0
            buttonMultiply.backgroundColor = UIColor.clear
        case 4 :
            if numButton == 0 || variableAnsver == 0 {
                answer.text = "0"
                variableAnsver = 0
                operation = 0
                buttonDivide.backgroundColor = UIColor.clear
            }
            else{
                answer.text = String(variableAnsver / numButton)
                variableAnsver = variableAnsver / numButton
                operation = 0
                buttonDivide.backgroundColor = UIColor.clear
            }
        default :
            answer.text = String(numButton)
            variableAnsver = numButton
        }
    }
}

