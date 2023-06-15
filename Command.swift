//
//  Command.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Команда - это как заказ в ресторане. Вы просто говорите официанту, что хотите заказать, и официант передает вашу команду на кухню, где шеф-повар выполняет ваш заказ. Паттерн Команда позволяет инкапсулировать запросы в объекты-команды, которые могут быть переданы и выполнены позднее. Это удобно, когда вы хотитесделать отмену операции или добавить возможность выполнения нескольких команд одновременно.

import Foundation
protocol Command {
    func execute()
}

class Light {
    func turnOn() {
        print("Light is on")
    }
    
    func turnOff() {
        print("Light is off")
    }
}

class LightOnCommand: Command {
    private let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOn()
    }
}

class LightOffCommand: Command {
    private let light: Light?
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOff()
    }
}

class RemoteControl {
    private var command: Command?
    
    func setCommand(command: Command) {
        self.command = command
    }
    
    func pressButton() {
        command?.execute()
    }
}

// Использование:
let light = Light()

let lightOnCommand = LightOnCommand(light: light)
let lightOffCommand = LightOffCommand(light: light)

let remoteControl = RemoteControl()

remoteControl.setCommand(command: lightOnCommand)
remoteControl.pressButton() // Выводит "Light is on"

remoteControl.setCommand(command: lightOffCommand)
remoteControl.pressButton() // Выводит "Light is off"
