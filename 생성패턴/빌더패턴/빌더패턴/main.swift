//
//  main.swift
//  빌더패턴
//
//  Created by J_Min on 2023/06/04.
//

import Foundation

enum Patty {
    case Beef, Chicken
}

enum Sauce {
    case Mustard, Ketchup
}

enum Vegetable {
    case Lettuce, Pickel
}

enum Bread {
    case HotDogBun, Flatbread
}

class Hambuger {
    let patties: [Patty]
    let sauces: [Sauce]
    let vegatables: [Vegetable]
    let bread: Bread
    let cheeseCount: Int
    
    init(patties: [Patty], sauces: [Sauce], vegatables: [Vegetable], bread: Bread, cheeseCount: Int) {
        self.patties = patties
        self.sauces = sauces
        self.vegatables = vegatables
        self.bread = bread
        self.cheeseCount = cheeseCount
    }
}

class HambugerBuilder {
    private var patties: [Patty]
    private var sauces: [Sauce] = []
    private var vegetables: [Vegetable] = []
    private var bread: Bread
    private var cheeseCount: Int = 0
    
    init(patty: Patty, bread: Bread) {
        self.patties = [patty]
        self.bread = bread
    }
    
    func addPatty(_ patty: Patty) -> HambugerBuilder {
        patties.append(patty)
        return self
    }
    
    func addSauce(_ sauce: Sauce) -> HambugerBuilder {
        sauces.append(sauce)
        return self
    }
    
    func addVegetable(_ vegetable: Vegetable) -> HambugerBuilder {
        vegetables.append(vegetable)
        return self
    }
    
    func setBread(_ bread: Bread) -> HambugerBuilder {
        self.bread = bread
        return self
    }
    
    func setCheese(_ count: Int) -> HambugerBuilder {
        self.cheeseCount = count
        return self
    }
    
    func build() -> Hambuger {
        Hambuger(patties: patties, sauces: sauces, vegatables: vegetables, bread: bread, cheeseCount: cheeseCount)
    }
}

class HambugerDirector {
    func createChickenBuger() -> Hambuger {
        HambugerBuilder(patty: .Chicken, bread: .Flatbread)
            .addSauce(.Ketchup)
            .setCheese(2)
            .addVegetable(.Pickel)
            .build()
    }
    
    func createBeefBuger() -> Hambuger {
        HambugerBuilder(patty: .Beef, bread: .Flatbread)
            .addSauce(.Ketchup)
            .setCheese(2)
            .addVegetable(.Pickel)
            .build()
    }
}

let hambuger = HambugerBuilder(patty: .Beef, bread: .Flatbread)
    .addPatty(.Beef)
    .addSauce(.Ketchup)
    .setCheese(2)
    .addVegetable(.Pickel)
    .build()

let director = HambugerDirector()
let chickenBuger = director.createChickenBuger()
