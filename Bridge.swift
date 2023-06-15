//
//  Bridge.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Мост отделяет абстракцию от ее реализации, позволяя им изменяться независимо друг от друга.

import Foundation

protocol Remote {
    func powerOn()
    func powerOff()
    func volumeUp()
    func volumeDown()
}

class TVRemote: Remote {
    func powerOn() {
        print("TV is on")
    }
    
    func powerOff() {
        print("TV is off")
    }
    
    func volumeUp() {
        print("TV volume up")
    }
    
    func volumeDown() {
        print("TV volume down")
    }
}

class DVDRemote: Remote {
    func powerOn() {
        print("DVD player is on")
    }
    
    func powerOff() {
        print("DVD player is off")
    }
    
    func volumeUp() {
        print("DVD volume up")
    }
    
    func volumeDown() {
        print("DVD volume down")
    }
}

class Device {
    private let remote: Remote
    
    init(remote: Remote) {
        self.remote = remote
    }
    
    func powerOn() {
        remote.powerOn()
    }
    
    func powerOff() {
        remote.powerOff()
    }
    
    func volumeUp() {
        remote.volumeUp()
    }
    
    func volumeDown() {
        remote.volumeDown()
    }
}

// Использование:
let tvRemote = TVRemote()
let tv = Device(remote: tvRemote)
tv.powerOn() // Выводит "TV is on"
tv.volumeUp() // Выводит "TV volume up"

let dvdRemote = DVDRemote()
let dvdPlayer = Device(remote: dvdRemote)
dvdPlayer.powerOn() // Выводит "DVD player is on"
dvdPlayer.volumeDown() // Выводит "DVD volume down"
