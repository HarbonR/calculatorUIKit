//
//  ViewController.swift
//  calculator
//
//  Created by  Pavel on 24.07.2024.
//

import UIKit

class ViewController: UIViewController {

    var variableAnswer : String = ""
    var operation : Character = " "
    var isPoint : Bool = false
    var isOperation : Bool = false
    
    @IBOutlet weak var answer: UILabel! // Поле ответа
    @IBOutlet weak var buttonPlus: UIButton! // Кнопка для сложения
    @IBAction func buttonPlusAction(_ sender: Any) {
        operationUpdate(charOperation: "+")
    }
    @IBOutlet weak var buttonMinus: UIButton! // Кнопка для вычитания
    @IBAction func buttonMinusAction(_ sender: Any) {
        operationUpdate(charOperation: "-")
    }
    @IBOutlet weak var buttonMultiply: UIButton! // Кнопка для умножения
    @IBAction func buttonMultiplyAction(_ sender: Any) {
        operationUpdate(charOperation: "*")
    }
    @IBOutlet weak var buttonDivide: UIButton! // Кнопка для деления
    @IBAction func buttonDivideAction(_ sender: Any) {
        operationUpdate(charOperation: "/")
    }
    @IBOutlet weak var buttonClear: UIButton! // Кнрпка для очистки результата
    @IBAction func buttonClearAction(_ sender: Any) {
        operationClear()
        variableAnswer = ""
        answer.text = "0"
        isPoint = false
    }
    @IBOutlet weak var buttonOne: UIButton!
    @IBAction func buttonOneAction(_ sender: Any) {
        answerUpdate(sign: "1")
    }
    @IBOutlet weak var buttonTwo: UIButton!
    @IBAction func buttonTwoAction(_ sender: Any) {
        answerUpdate(sign: "2")
    }
    @IBOutlet weak var buttonThree: UIButton!
    @IBAction func buttonThreeAction(_ sender: Any) {
        answerUpdate(sign: "3")
    }
    @IBOutlet weak var buttonFour: UIButton!
    @IBAction func buttonfourAction(_ sender: Any) {
        answerUpdate(sign: "4")
    }
    @IBOutlet weak var buttonFive: UIButton!
    @IBAction func buttonFiveAction(_ sender: Any) {
        answerUpdate(sign: "5")
    }
    @IBOutlet weak var buttonSix: UIButton!
    @IBAction func buttonSixAction(_ sender: Any) {
        answerUpdate(sign: "6")
    }
    @IBOutlet weak var buttonSeven: UIButton!
    @IBAction func buttonSevenAction(_ sender: Any) {
        answerUpdate(sign: "7")
    }
    @IBOutlet weak var buttonEight: UIButton!
    @IBAction func buttonEightAction(_ sender: Any) {
        answerUpdate(sign: "8")
    }
    @IBOutlet weak var buttonNine: UIButton!
    @IBAction func buttonNineAction(_ sender: Any) {
        answerUpdate(sign: "9")
    }
    @IBOutlet weak var buttonZero: UIButton!
    @IBAction func buttonZeroAction(_ sender: Any) {
        answerUpdate(sign: "0")
    }
    @IBOutlet weak var buttonPoint: UIButton!
    
    @IBAction func buttonPointAction(_ sender: Any) {
        if !isPoint{
            if answer.text == "0" || isOperation{
                answer.text = "0."
                isOperation = false
            }
            else{
                if let answerString = answer.text{
                    answer.text = answerString + "."
                }
            }
            isPoint = true
        }
    }
    @IBOutlet weak var buttonAnswer: UIButton! // Кнопка для вывода результата
    @IBAction func buttonAnswerAction(_ sender: Any) {
        var varAnswer : Double = 0
        if let answerString = answer.text, let answerDouble = Double(answerString){
            if let variableAnswerDouble = Double(variableAnswer) {
                switch operation {
                case "+":
                    varAnswer = variableAnswerDouble + answerDouble
                case "-":
                    varAnswer = variableAnswerDouble - answerDouble
                case "*":
                    varAnswer = variableAnswerDouble * answerDouble
                case "/":
                    if variableAnswerDouble == 0 || answerDouble == 0{
                        varAnswer = 0
                    }
                    else{
                        varAnswer = variableAnswerDouble / answerDouble
                    }
                default:
                    break
                }
            }
        }
        if varAnswer.truncatingRemainder(dividingBy: 1) == 0{ // Определяем является ли число целым.
            answer.text = String(Int(varAnswer))
            isPoint = false
        }
        else{
            answer.text = String(varAnswer)
            isPoint = true
        }
        operationClear()
    }
    
    func answerUpdate(sign : String){
        if answer.text == "0" || isOperation{
            answer.text = ""
            isOperation = false
        }
        if let answerString = answer.text{
            answer.text = answerString + sign
        }
    }
    
    func operationClear(){
        operation = " "
        isOperation = false
        buttonPlus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMinus.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMultiply.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonDivide.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
    }
    
    func operationUpdate(charOperation : Character){
        operationClear()
        isOperation = true
        isPoint = false
        switch charOperation{
        case "+":
            operation = "+"
            buttonPlus.backgroundColor = UIColor.purple
        case "-":
            operation = "-"
            buttonMinus.backgroundColor = UIColor.purple
        case "*":
            operation = "*"
            buttonMultiply.backgroundColor = UIColor.purple
        case "/":
            operation = "/"
            buttonDivide.backgroundColor = UIColor.purple
        default:
            break
        }
        if let answerString = answer.text{
            variableAnswer = answerString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

