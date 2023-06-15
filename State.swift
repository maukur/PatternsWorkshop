//
//  State.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Состояние - это как настроение утром. В один день вы можете проснуться радостным, в другой день - усталым, а иногда - весь день ощущать сонливость. Паттерн Состояние позволяет объекту изменять свое поведение в зависимости от внутреннего состояния. Также, как ваше настроение влияет на то, как вы реагируете на внешние события.

import Foundation

protocol State {
    func handle()
}

class HappyState: State {
    func handle() {
        print("I'm in a happy state! Everything is awesome!")
    }
}

class TiredState: State {
    func handle() {
        print("I'm in a tired state... Need more sleep...")
    }
}

class SleepyState: State {
    func handle() {
        print("I'm in a sleepy state... Zzz...")
    }
}

class Person {
    private var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func setState(state: State) {
        self.state = state
    }
    
    func handleState() {
        state.handle()
    }
}

// Использование:
let happyState = HappyState()
let tiredState = TiredState()
let sleepyState = SleepyState()

let person = Person(state: happyState)
person.handleState() // Выводит "I'm in a happy state! Everything is awesome!"

person.setState(state: tiredState)
person.handleState() // Выводит "I'm in a tired state... Need more sleep..."

person.setState(state: sleepyState)
person.handleState() // Выводит "I'm in a sleepy state... Zzz..."
