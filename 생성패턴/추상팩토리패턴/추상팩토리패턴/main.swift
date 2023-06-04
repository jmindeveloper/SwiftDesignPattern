//
//  main.swift
//  추상팩토리패턴
//
//  Created by J_Min on 2023/06/04.
//

import Foundation

protocol Wheel {
    var size: CGFloat { get }
}

protocol Trunk {
    var capacity: CGFloat { get }
}

class PassengerCarWheel: Wheel {
    var size: CGFloat = 15
}

class PassengerCarTrunk: Trunk {
    var capacity: CGFloat = 100
}

class TruckWheel: Wheel {
    var size: CGFloat = 45
}

class TruckTrunk: Trunk {
    var capacity: CGFloat = 1000
}

protocol CarFactory {
    func createWheel() -> Wheel
    func createTrunk() -> Trunk
}

class PassengerCarFactory: CarFactory {
    func createWheel() -> Wheel {
        return PassengerCarWheel()
    }
    
    func createTrunk() -> Trunk {
        return PassengerCarTrunk()
    }
}

class TruckFactory: CarFactory {
    func createWheel() -> Wheel {
        return TruckWheel()
    }
    
    func createTrunk() -> Trunk {
        return TruckTrunk()
    }
}

class CarCreater {
    var carFactory: CarFactory
    
    init(carFactory: CarFactory) {
        self.carFactory = carFactory
    }
    
    func create() {
        let wheel = carFactory.createWheel()
        let trunk = carFactory.createTrunk()
    }
}

let truck = CarCreater(carFactory: TruckFactory()).create()
let passengerCar = CarCreater(carFactory: PassengerCarFactory()).create()
