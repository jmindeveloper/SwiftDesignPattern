//
//  main.swift
//  프로토타입패턴
//
//  Created by J_Min on 2023/06/28.
//

import Foundation

protocol Prototype {
    func copy() -> Self
    init(prototype: Self)
}

extension Prototype {
    func copy() -> Self {
        return type(of: self).init(prototype: self)
    }
}

enum Gender {
    case Male, Female
}

class Person: Prototype {
    let name: String
    let age: Int
    let gender: Gender
    
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    required init(prototype: Person) {
        self.name = prototype.name
        self.age = prototype.age
        self.gender = prototype.gender
    }
}

// client code
let person = Person(name: "김지민", age: 25, gender: .Male)
let personClone = person.copy()
