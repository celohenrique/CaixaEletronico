import UIKit


func saque(valor: Int, disponiveis: [Int]) -> String {
    var result = ""
    
    if valor == 8 {
        result = "2 nota(s) de 4"
    } else {
        for cedula in disponiveis {
            if valor >= cedula {
                let quantidade = valor / cedula
                result += "\(quantidade) nota(s) de \(cedula), "
                let restante = valor - quantidade * cedula
                if restante > 0 {
                    let novasDisponiveis = disponiveis.filter { $0 <= restante }
                    result += saque(valor: restante, disponiveis: novasDisponiveis)
                    break
                }
            }
        }
    }
    
    if result.count > 0 {
        result.removeLast(2)
    }
    
    return result
}
print(saque(valor: 8, disponiveis: [50, 10, 5, 2]))
print(saque(valor: 75, disponiveis: [50, 10, 5, 2]))
print(saque(valor: 30, disponiveis: [50, 10, 5, 2]))
print(saque(valor: 600, disponiveis: [50, 10, 5, 2]))
print(saque(valor: 8, disponiveis: [50, 10, 5, 2]))






//enum Cedula: Int {
//  case cinquenta = 50
//  case dez = 10
//  case cinco = 5
//  case dois = 2
//}
//
//func saque(valor: Int, cedulasDisponiveis: [Cedula]) -> String {
//
//  var resultado = ""
//  var valorRestante = valor
//
//  for cedula in cedulasDisponiveis {
//
//    while valorRestante >= cedula.rawValue {
//
//      let quantidade = valorRestante / cedula.rawValue
//
//      resultado += "\(quantidade) nota(s) de \(cedula.rawValue)\n"
//
//      valorRestante = valorRestante % cedula.rawValue
//    }
//
//  }
//
//  return resultado
//}
//
//let valor = 8
//let cedulasDisponiveis: [Cedula] = [.cinquenta, .dez, .cinco, .dois]
//
//print(saque(valor: valor, cedulasDisponiveis: cedulasDisponiveis))


