//
//  Observer.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Наблюдатель - это как поход в кино. Вы покупаете билет, занимаете место в зале и ждете фильм. Вам не нужно следить за каждым кадром и изменениями на экране. Просто смотрите и наслаждаетесь. Паттерн Наблюдатель позволяет объектам следить за другими объектами и автоматически реагировать на их изменения, как зритель в кинозале.

import Foundation

protocol Observer: AnyObject {
    func update()
}

protocol Subject {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notifyObservers()
}

class WeatherStation: Subject {
    private var observers: [Observer] = []
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update()
        }
    }
    
    func updateTemperature() {
        // Логика обновления температуры
        notifyObservers()
    }
}

class TemperatureDisplay: Observer {
    private var temperature: Double = 0.0
    
    func update() {
        // Логика обновления отображения температуры
        print("Temperature updated: \(temperature)°C")
    }
    
    func setTemperature(temperature: Double) {
        self.temperature = temperature
    }
}

// Использование:
let weatherStation = WeatherStation()
let temperatureDisplay = TemperatureDisplay()

weatherStation.addObserver(temperatureDisplay)
weatherStation.updateTemperature() // Выводит "Temperature updated: 0.0°C"

temperatureDisplay.setTemperature(temperature: 25.0)
weatherStation.updateTemperature() // Выводит "Temperature updated: 25.0°C"
