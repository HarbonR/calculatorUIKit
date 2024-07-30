//
//  ViewController.swift
//  calculator
//
//  Created by  Pavel on 24.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //====================================================================================================
    // Общие переменные
    var variableAnswer : String = "" // Переменная для хранения промежуточного ответа
    var operation : Character = " " // Переменная для хранения типа операции + - * /
    var isPoint : Bool = false // Переменная для хранения значения включен ли режим дробного значения или нет
    var isOperation : Bool = false // Переменная для хранения значения выполняется операция или нет в данный момент
    //====================================================================================================
    // Поле для отображения ответа
    @IBOutlet weak var answer: UILabel! // Поле ответа
    //====================================================================================================
    // Кнрпки с операциями
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
        buttonTapped(button: buttonClear)
        operationClear()
        variableAnswer = ""
        answer.text = "0"
        isPoint = false
    }
    //----------------------------------------------------------------------------------------------------
    // Функционал при нажатии на одну из кнопок операций
    func operationClear(){
        operation = " "
        isOperation = false
        buttonPlus.configuration?.background.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMinus.configuration?.background.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonMultiply.configuration?.background.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
        buttonDivide.configuration?.background.backgroundColor = UIColor.clear // Отчищаем цвет не активной кнопки
    }
    
    func operationUpdate(charOperation : Character){
        operationClear()
        isOperation = true
        isPoint = false
        switch charOperation{
        case "+":
            operation = "+"
            buttonPlus.configuration?.background.backgroundColor = UIColor.darkGray
        case "-":
            operation = "-"
            buttonMinus.configuration?.background.backgroundColor = UIColor.darkGray
        case "*":
            operation = "*"
            buttonMultiply.configuration?.background.backgroundColor = UIColor.darkGray
        case "/":
            operation = "/"
            buttonDivide.configuration?.background.backgroundColor = UIColor.darkGray
        default:
            break
        }
        if let answerString = answer.text{
            variableAnswer = answerString
        }
    }
    //====================================================================================================
    // Кнопки с цифрами
    @IBOutlet weak var buttonOne: UIButton!
    @IBAction func buttonOneAction(_ sender: Any) {
        answerUpdate(sign: "1")
        buttonTapped(button: buttonOne)
    }
    @IBOutlet weak var buttonTwo: UIButton!
    @IBAction func buttonTwoAction(_ sender: Any) {
        answerUpdate(sign: "2")
        buttonTapped(button: buttonTwo)
    }
    @IBOutlet weak var buttonThree: UIButton!
    @IBAction func buttonThreeAction(_ sender: Any) {
        answerUpdate(sign: "3")
        buttonTapped(button: buttonThree)
    }
    @IBOutlet weak var buttonFour: UIButton!
    @IBAction func buttonfourAction(_ sender: Any) {
        answerUpdate(sign: "4")
        buttonTapped(button: buttonFour)
    }
    @IBOutlet weak var buttonFive: UIButton!
    @IBAction func buttonFiveAction(_ sender: Any) {
        answerUpdate(sign: "5")
        buttonTapped(button: buttonFive)
    }
    @IBOutlet weak var buttonSix: UIButton!
    @IBAction func buttonSixAction(_ sender: Any) {
        answerUpdate(sign: "6")
        buttonTapped(button: buttonSix)
    }
    @IBOutlet weak var buttonSeven: UIButton!
    @IBAction func buttonSevenAction(_ sender: Any) {
        answerUpdate(sign: "7")
        buttonTapped(button: buttonSeven)
    }
    @IBOutlet weak var buttonEight: UIButton!
    @IBAction func buttonEightAction(_ sender: Any) {
        answerUpdate(sign: "8")
        buttonTapped(button: buttonEight)
    }
    @IBOutlet weak var buttonNine: UIButton!
    @IBAction func buttonNineAction(_ sender: Any) {
        answerUpdate(sign: "9")
        buttonTapped(button: buttonNine)
    }
    @IBOutlet weak var buttonZero: UIButton!
    @IBAction func buttonZeroAction(_ sender: Any) {
        answerUpdate(sign: "0")
        buttonTapped(button: buttonZero)
    }
    //----------------------------------------------------------------------------------------------------
    // Функционал при нажатии кнопок с числами
    func answerUpdate(sign : String){
        if answer.text == "0" || isOperation{
            answer.text = ""
            isOperation = false
        }
        if let answerString = answer.text{
            answer.text = answerString + sign
        }
    }
    //====================================================================================================
    // Кнопка для включения дробного значения
    @IBOutlet weak var buttonPoint: UIButton! // Кнопка для добавления дробного знака
    
    @IBAction func buttonPointAction(_ sender: Any) {
        buttonTapped(button: buttonPoint)
        if !isPoint{ // Если активно дробное число
            if answer.text == "0" || isOperation { // Если ответ равен 0 или выполняется одна из операций
                answer.text = "0." // Добавляем 0 и .
                isOperation = false //
            }
            else { // Если в ответе стоит некоторое число отличное от нуля
                if let answerString = answer.text{
                    answer.text = answerString + "."
                }
            }
            isPoint = true // Указываем, что точка стоит, что-бы не было задвоение дробного знака
        }
    }
    //====================================================================================================
    // Кнопка для вывода результата =
    @IBOutlet weak var buttonAnswer: UIButton! // Кнопка для вывода результата
    @IBAction func buttonAnswerAction(_ sender: Any) {
        buttonTapped(button: buttonAnswer)
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
    //====================================================================================================
    // Общие функции
    @objc func buttonTapped(button: UIButton) { // Функция для анимации при нажатии на кнопки
        UIView.animate(withDuration: 0.2, animations: { // Сначала выполняется первая анимация.
            button.configuration?.background.backgroundColor = UIColor.darkGray // Новый цвет при нажатии
            button.frame.size = CGSize(width: 55, height: 55)
        }) { _ in // После завершения выполняется вторая. Конструкция _ in нужна так как анимация выполняется асинхронно.
            UIView.animate(withDuration: 0.2) {
                button.frame.size = CGSize(width: 50, height: 50)
                button.configuration?.background.backgroundColor = UIColor.clear // Возврат к исходному цвету
            }
        }
    }
    //====================================================================================================
    // Функция при загрузки приложения
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white // Устанавливаем белый фон приложения
    }
    //====================================================================================================
}
