//
//  Composite.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Компоновщик позволяет объединять объекты в древовидные структуры для представления иерархии части-целое. Клиенты могут обращаться к отдельным объектам и группам объектов одинаковым образом.

import Foundation

protocol Component {
    func operation()
}

class Leaf: Component {
    func operation() {
        print("Leaf: Operation")
    }
}

class Composite: Component {
    private var children: [Component] = []
    
    func add(component: Component) {
        children.append(component)
    }
    
    func remove(component: Component) {
        children.removeAll { $0 === component }
    }
    
    func operation() {
        print("Composite: Operation")
        for child in children {
            child.operation()
        }
    }
}

// Использование:
let leaf1 = Leaf()
let leaf2 = Leaf()

let composite = Composite()
composite.add(component: leaf1)
composite.add(component: leaf2)

composite.operation()
// Выводит:
// Composite: Operation
// Leaf: Operation
// Leaf: Operation
