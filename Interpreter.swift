//
//  Interpreter.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Интерпретатор определяет представление грамматического предложения и интерпретирует его. Каждый терминальный символ грамматики имеет соответствующий класс, а не-терминальные символы представлены композицией терминальных символов.


import Foundation

protocol Expression {
    func interpret(context: String) -> Bool
}

class TerminalExpression: Expression {
    private let data: String
    
    init(data: String) {
        self.data = data
    }
    
    func interpret(context: String) -> Bool {
        return context.contains(data)
    }
}

class OrExpression: Expression {
    private let expression1: Expression
    private let expression2: Expression
    
    init(expression1: Expression, expression2: Expression) {
        self.expression1 = expression1
        self.expression2 = expression2
    }
    
    func interpret(context: String) -> Bool {
        return expression1.interpret(context: context) || expression2.interpret(context: context)
    }
}

class AndExpression: Expression {
    private let expression1: Expression
    private let expression2: Expression
    
    init(expression1: Expression, expression2: Expression) {
        self.expression1 = expression1
        self.expression2 = expression2
    }
    
    func interpret(context: String) -> Bool {
        return expression1.interpret(context: context) && expression2.interpret(context: context)
    }
}

// Использование:
let context = "Hello, World!"

let expression1 = TerminalExpression(data: "Hello")
let expression2 = TerminalExpression(data: "World")
let expression3 = AndExpression(expression1: expression1, expression2: expression2)

print(expression3.interpret(context: context)) // Выводит "true"
