//
//  Chain of Responsibility.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Цепочка Обязанностей - это как прохождение городской суеты. Если вы идете по улице и на вас кто-то кричит, вы оборачиваетесь, чтобы посмотреть, но если это не для вас, вы просто идете дальше, не заботясь о том, что говорят другие. Паттерн Цепочка Обязанностей позволяет объектам последовательно обрабатывать запросы, пока один из них не обработает запрос или его не проигнорирует. Это удобно, когда вам необходимо выбрать одну из нескольких возможных реакций на событие.
import Foundation

protocol Handler {
    var nextHandler: Handler? { get set }
    func handleRequest(request: String)
}

class ConcreteHandlerA: Handler {
    var nextHandler: Handler?
    
    func handleRequest(request: String) {
        if request == "A" {
            print("Handling request A")
        } else {
            nextHandler?.handleRequest(request: request)
        }
    }
}

class ConcreteHandlerB: Handler {
    var nextHandler: Handler?
    
    func handleRequest(request: String) {
        if request == "B" {
            print("Handling request B")
        } else {
            nextHandler?.handleRequest(request: request)
        }
    }
}

// Использование:
let handlerA = ConcreteHandlerA()
let handlerB = ConcreteHandlerB()

handlerA.nextHandler = handlerB

handlerA.handleRequest(request: "A") // Выводит "Handling request A"
handlerA.handleRequest(request: "B") // Выводит "Handling request B"
handlerA.handleRequest(request: "C") // Ничего не выводит
