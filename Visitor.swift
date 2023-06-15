//
//  Visitor.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Посетитель позволяет добавлять операции к объектам без изменения их классов. Операции реализуются в отдельных классах-посетителях, которые посещают объекты и выполняют соответствующие операции.

import Foundation

protocol Visitor {
    func visit(element: ElementA)
    func visit(element: ElementB)
}

protocol Element {
    func accept(visitor: Visitor)
}

class ElementA: Element {
    func accept(visitor: Visitor) {
        visitor.visit(element: self)
    }
    
    func operationA() {
        print("Выполняется операция A в Element A")
    }
}

class ElementB: Element {
    func accept(visitor: Visitor) {
        visitor.visit(element: self)
    }
    
    func operationB() {
        print("Выполняется операция B в Element B")
    }
}

class ConcreteVisitor: Visitor {
    func visit(element: ElementA) {
        element.operationA()
    }
    
    func visit(element: ElementB) {
        element.operationB()
    }
}

// Использование:
let visitor = ConcreteVisitor()

let elementA = ElementA()
let elementB = ElementB()

elementA.accept(visitor: visitor) // Выводит "Выполняется операция A в Element A"
elementB.accept(visitor: visitor) // Выводит "Выполняется операция B в Element B"
