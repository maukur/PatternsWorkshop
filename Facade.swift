//
//  Facade.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Фасад предоставляет унифицированный интерфейс для группы интерфейсов в подсистеме. Упрощает работу с комплексной подсистемой, предоставляя простой и понятный интерфейс.
import Foundation

// Подсистема
class Subsystem1 {
    func operation1() {
        print("Subsystem 1: Operation 1")
    }
    
    func operation2() {
        print("Subsystem 1: Operation 2")
    }
}

class Subsystem2 {
    func operation1() {
        print("Subsystem 2: Operation 1")
    }
    
    func operation2() {
        print("Subsystem 2: Operation 2")
    }
}

// Фасад
class Facade {
    private let subsystem1: Subsystem1
    private let subsystem2: Subsystem2
    
    init() {
        subsystem1 = Subsystem1()
        subsystem2 = Subsystem2()
    }
    
    func operation() {
        subsystem1.operation1()
        subsystem2.operation2()
    }
}

// Использование:
let facade = Facade()
facade.operation()
// Выводит:
// Subsystem 1: Operation 1
// Subsystem 2: Operation 2
