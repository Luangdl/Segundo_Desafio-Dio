import UIKit

// Protocol

protocol Greetable {
    func greet() -> String
}

class Person: Greetable {
    var name: String
    
    init(name: String) {
        self.name = name
    }

    func greet() -> String {
        return "Olá, meu nome é \(name)."
    }
}

let person = Person(name: "Alice")
let greeting = person.greet()
print(greeting)


//-----------------------------------------------


protocol Printable {
    func printInfo()
}

class VehicleBase {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func startEngine() {
        print("O motor do \(brand) está ligado.")
    }
}


class CarSubclass: VehicleBase, Printable {
    var model: String
    
    init(brand: String, model: String) {
        self.model = model
        super.init(brand: brand)
    }
    
    func printInfo() {
        print("Esse é um carro da marca \(brand), modelo \(model).")
    }
}

let myCar = CarSubclass(brand: "Ford", model: "Mustang")
myCar.printInfo()

myCar.startEngine()

//-----------------------------------------------

// Extension




protocol Greeter {
    func greet() -> String
}

struct Individual: Greeter {
    var personName: String
    
    init(personName: String) {
        self.personName = personName
    }
    
    func greet() -> String {
        return "Ola, meu nome é \(personName)."
    }
}

extension String: Greeter {
    func greet() -> String {
        return "Ola, meu nome é \(self)."
    }
}

func introduceSomeone(_ someone: Greeter) {
    print(someone.greet())
}


let person1 = Individual(personName: "Alice")
let nameString = "Bob"

introduceSomeone(person1)
introduceSomeone(nameString)


//-----------------------------------------------


protocol Printable1 {
    mutating func printMessage()
}

extension Int: Printable1 {
    mutating func printMessage() {
        for _ in 1...self {
            print("Imprimindo...")
        }
    }
}

var repetitions = 3
repetitions.printMessage()


//-----------------------------------------------


protocol Animal {
    func makeSound()
}

enum AnimalType: Animal {
    case dog
    case cat
    case bird

    func makeSound() {
        switch self {
        case AnimalType.dog:
            print("O cachorro late!")
        case AnimalType.cat:
            print("O gato faz miau!")
        case AnimalType.bird:
            print("O passáro canta!")
        }
    }
}

func emitSoundForAnimal(_ animal: AnimalType) {
    animal.makeSound()
}

emitSoundForAnimal(.dog)
emitSoundForAnimal(.cat)
emitSoundForAnimal(.bird)
