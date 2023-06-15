//
//  Memento.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Хранитель позволяет сохранять и восстанавливать состояние объекта без нарушения инкапсуляции. Хранитель создает объект-хранитель, который хранит текущее состояние и может восстанавливать его.

import Foundation

class Memento {
    private let state: String
    
    init(state: String) {
        self.state = state
    }
    
    func getState() -> String {
        return state
    }
}

class Originator {
    private var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func setState(state: String) {
        self.state = state
    }
    
    func saveState() -> Memento {
        return Memento(state: state)
    }
    
    func restoreState(memento: Memento) {
        state = memento.getState()
    }
}

class Caretaker {
    private var mementos: [Memento] = []
    
    func addMemento(memento: Memento) {
        mementos.append(memento)
    }
    
    func getMemento(at index: Int) -> Memento? {
        guard index >= 0 && index < mementos.count else {
            return nil
        }
        return mementos[index]
    }
}

// Использование:
let originator = Originator(state: "State 1")
let caretaker = Caretaker()

caretaker.addMemento(memento: originator.saveState()) // Сохраняем состояние

originator.setState(state: "State 2") // Изменяем состояние
print(originator.getState()) // Выводит "State 2"

if let memento = caretaker.getMemento(at: 0) {
    originator.restoreState(memento: memento) // Восстанавливаем состояние
    print(originator.getState()) // Выводит "State 1"
}
