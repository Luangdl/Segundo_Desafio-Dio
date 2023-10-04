import UIKit

//Classe e atributos

class Home {
    var room = 2
    var kitchen = 1
    var bathroom = 1
}

class People {
    var residence: Home?
}

//Instancia da classe em um objeto

let luan = People()
luan.residence = Home()
luan.residence?.bathroom = 3

if let numberOfRooms = luan.residence?.room,
   let numberofBathromm = luan.residence?.bathroom,
   let numberofKitchen = luan.residence?.kitchen {
    print("A casa de Luan possui \(numberOfRooms) quartos, \(numberofBathromm) banheiros e \(numberofKitchen) cozinha.")
    } else {
    print("Não foi possível definir o número de quartos ou banheiros.")
    }



class nameSidesSquare {
    
    var sides = 4
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func description() -> String {
        return "Um quadrado com \(sides) lados"
    }
}

class childSideSquare: nameSidesSquare {
    
    override init(name: String) {
        super.init(name: name)
        sides = 6
    }
    
    override func description() -> String {
        return "O quadrado na verdade possui \(sides) lados e está sem \(name)"
    }
}

let result = childSideSquare(name: "nome")
result.description()


/*------------------------------------- - -----------------------*/

// Enum


enum Bebida: Int {
    case suco = 1
    case leite, cerveja, whisky
  
    var sorteio: String {
        
        switch self {
        case .leite:
            return "leite Quente "
        case .cerveja:
            return "cerveja Gelada"
        case .whisky:
            return "Whisky Forte"
        case .suco:
            return "Suco Gelado"
        }
    }
    
    
    
}

let suco = Bebida.suco
suco.rawValue
suco.sorteio
let leite = Bebida.leite
leite.sorteio




enum DiaDaSemana {
    case segunda
    case terca
    case quarta
    case quinta
    case sexta
    case sabado
    case domingo
    
    func mensagem() -> String {
        switch self {
        case .segunda, .terca, .quarta, .quinta, .sexta:
            return "É um dia de trabalho."
        case .sabado, .domingo:
            return "É o fim de semana!"
        }
    }
}

let hoje = DiaDaSemana.quarta
let mensagemHoje = hoje.mensagem()
print("Hoje é \(hoje) e \(mensagemHoje)")



/*------------------------------------- - -----------------------*/

//Struct


struct House {
    var room = 2
    var kitchen = 1
    var bathroom = 1
}

var luanHome = Home()
var copyOfLuanHome = luanHome

// Modificando a cópia independente
copyOfLuanHome.room = 3
copyOfLuanHome.bathroom = 2

print("Número de quartos em casa de Luan: \(luanHome.room)")
print("Número de banheiros em casa de Luan: \(luanHome.bathroom)")



/*------------------------------------- - -----------------------*/


// Controle de fluxo - Uso de for, if e while.

let classeAge = [10, 13, 5, 18, 21, 25]
var minimumAge = 18
for age in classeAge {
    if age >= 18 {
        print("É maior de idade somente quem possui \(age)")
    } else {
        print ("Não tem a minima idade quem possui \(age)")
    }
}



var x = 1

while x <= 5 {
    print(x)
    x += 1
}

/*------------------------------------- - -----------------------*/


// Coleção - Arrays - Sets e Dicionários


var numbers: [Int] = []

numbers.append(0)
numbers.append(1)
numbers.append(2)
numbers += [3]

print("A lista contém \(numbers.count) números.")

numbers += [4]

print("A lista contém \(numbers.count) números.")

if numbers.isEmpty {
    print("A lista de números está vazia")
} else {
    print("A lista contém \(numbers.count) números")
}

for number in numbers {
    print(number)
}

var thirdNumber = numbers[3]
numbers[3] = 7

print(numbers)

numbers[0...4] = [10, 20, 30,40]

print(numbers)

numbers.insert(50, at: 0)

numbers.remove(at: 0)
print(numbers)

numbers.removeLast()
print(numbers)


// Sets


var books: Set<String> = ["Escrito, online, digital"]

var newBooks: Set = ["Romance", "Terror", "Acao"]
print("Existem \(newBooks.count) tipo(s) de livro na lista")

if newBooks.isEmpty {
    print("A lista de livros está vazia")
} else {
    print("A lista contém \(newBooks.count) livros")
}

newBooks.insert("Suspense")
print(newBooks)

if let removed = newBooks.remove("Terror") {
    print("Nao gosto mais de filme de \(removed)")
} else {
    print("Continuo gostando dos mesmos tipos de filmes")
}


var words = Set<String>()
print("words possui \(words.count) itens")

words.insert("Agua, Terra, Fogo, Ar")
print(words)

for newWord in words {
    print("\(newWord)")
}


// Dicionário


var gamePosition: [Int: String] = [:]
gamePosition[1] = "Primeira"
gamePosition[2] = "Segunda"
gamePosition[3] = "Terceira"

var chess: [Int: String] = [1:"Dama", 2:"Rei", 3:"Copa"]

if chess.isEmpty {
    print("Náo ha nenhuma carta em cards")
} else  {
    print("Tem \(chess.count) cartas em cards")
}

chess[4] = "Peao"
print(chess)

chess.updateValue("Torre", forKey: 4)
print(chess)

chess.removeValue(forKey: 4)
print(chess)

for newChess in chess {
    print(newChess)
}


/*------------------------------------- - -----------------------*/


// Funções


func speak(words: String, scream: String) -> String {
    return("Diga \(words) em voz alta através de \(scream)")
}

speak(words: "Socorro", scream: "Gritos")

func calculateAge(ages: [Int]) -> (minima: Int, maxima: Int) {
    
    var minima = ages[0]
    var maxima = ages[0]
    
    for age in ages {
        if age > maxima {
            maxima = age
        } else if age < minima {
            minima = age
        }
        minima += maxima
        
    }
    return (minima, maxima)
}

let ages = calculateAge(ages: [0, 15, 16, 17,20])
    print(ages.self)


/* Função aninhada*/


func buildHome()  {
    
    var bath = "banheiro"
    
    func add(room: String, kitchen: String) -> String {
        return("Os comodos \(room), \(kitchen), \(bath) formam uma casa")
    }
    
    add(room: "Quarto", kitchen: "Cozinha")
}

buildHome()


// Closures


var numberss = [1, 5, 3 ,9]

numberss.map({ (number: Int) -> Int in
    let result = 2 * number
    return result
})

let sortedNumbers = numberss.sorted { $0 < $1 }
print(sortedNumbers)


/*------------------------------------- - -----------------------*/


//Concorrencia


func task1() {
    for i in 1...5 {
        print("Tarefa 1: Contagem \(i)")
    }
}

func task2() {
    for i in 1...5 {
        print("Tarefa 2: Contagem \(i)")
    }
}

DispatchQueue.global().async {
    task1()
}

DispatchQueue.global().async {
    task2()
}



print("Todas as tarefas foram concluídas.")



let concurrentQueue = DispatchQueue.global(qos: .background)

func performAsyncTask(taskNumber: Int) {
    concurrentQueue.async {
        for i in 1...5 {
            print("Tarefa \(taskNumber): Contagem \(i)")
        }
    }
}

for taskNumber in 1...3 {
    performAsyncTask(taskNumber: taskNumber)
}

print("Todas as tarefas foram concluídas.")


