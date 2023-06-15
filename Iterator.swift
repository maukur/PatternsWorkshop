//
//  Iterator.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Итератор предоставляет способ последовательного доступа к элементам коллекции без раскрытия его внутренней структуры.


import Foundation

class Iterator<T> {
    private let elements: [T]
    private var index: Int = 0
    
    init(elements: [T]) {
        self.elements = elements
    }
    
    func hasNext() -> Bool {
        return index < elements.count
    }
    
    func next() -> T? {
        guard index < elements.count else {
            return nil
        }
        let element = elements[index]
        index += 1
        return element
    }
}

// Использование:
let numbers = [1, 2, 3, 4, 5]
let iterator = Iterator(elements: numbers)

while iterator.hasNext() {
    if let number = iterator.next() {
        print(number)
    }
}
