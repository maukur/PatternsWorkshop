//
//  Mediator.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Посредник определяет объект, который инкапсулирует взаимодействие множества объектов. Посредник обеспечивает слабую связь между объектами, сокращает зависимости и упрощает взаимодействие.

import Foundation

protocol Mediator {
    func notify(sender: Colleague, event: String)
}

protocol Colleague {
    var mediator: Mediator { get }
    func send(event: String)
    func receive(event: String)
}

class ConcreteMediator: Mediator {
    func notify(sender: Colleague, event: String) {
        sender.receive(event: event)
    }
}

class ConcreteColleagueA: Colleague {
    let mediator: Mediator
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func send(event: String) {
        mediator.notify(sender: self, event: event)
    }
    
    func receive(event: String) {
        print("Colleague A received: \(event)")
    }
}

class ConcreteColleagueB: Colleague {
    let mediator: Mediator
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func send(event: String) {
        mediator.notify(sender: self, event: event)
    }
    
    func receive(event: String) {
        print("Colleague B received: \(event)")
    }
}

// Использование:
let mediator = ConcreteMediator()

let colleagueA = ConcreteColleagueA(mediator: mediator)
let colleagueB = ConcreteColleagueB(mediator: mediator)

colleagueA.send(event: "Hello from A") // Выводит "Colleague A received: Hello from A"
colleagueB.send(event: "Hi from B") // Выводит "Colleague B received: Hi from B"
