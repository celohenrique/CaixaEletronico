import UIKit

let cedulasDisponiveis = [50, 10, 5, 2]

var stock = [3, 3, 3, 3]

func saque(valor: Int, estoque: [Int]) -> String {
    var valor = valor
    var estoque = estoque
    if valor < 0 {
        return "Não é possível realizar o saque."
    }
    
    if valor == 0 {
        return ""
    }
    
    var resultado: [String] = []
    
    for i in 0..<cedulasDisponiveis.count {
        let cedula = cedulasDisponiveis[i]
        var count = 0
        
        while valor >= cedula && estoque[i] > 0 {
            valor -= cedula
            estoque[i] -= 1
            count += 1
        }
        
        if count > 0 {
            resultado.append("\(cedula)x\(count)")
        }
    }
    
    if valor == 0 {
        return resultado.joined(separator: " | ")
    } else {
        // adiciona as cédulas retiradas de volta no estoque
        for i in 0..<cedulasDisponiveis.count {
            estoque[i] += (resultado.filter{ $0.contains("\(cedulasDisponiveis[i])") }.count)
        }
        return "Não é possível realizar o saque."
    }
}

print(saque(valor: 205, estoque: stock))
print(saque(valor: 75, estoque: stock))
print(saque(valor: 30, estoque: stock))
print(saque(valor: 600, estoque: stock))
print(saque(valor: 8, estoque: stock))
