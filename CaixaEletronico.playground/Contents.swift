import UIKit

enum Cedula: Int {
  case cinquenta = 50
  case dez = 10
  case cinco = 5
  case dois = 2
}

func saque(valor: Int, cedulasDisponiveis: [Cedula]) -> String {
  var resultado = ""
  var valorRestante = valor
  
  for cedula in cedulasDisponiveis {
      
    while valorRestante >= cedula.rawValue {
        
      let quantidade = valorRestante / cedula.rawValue
        
      resultado += "\(quantidade) nota(s) de \(cedula.rawValue)\n"
        
      valorRestante = valorRestante % cedula.rawValue
    }
      
  }
  
  return resultado
}

let valor = 8
let cedulasDisponiveis: [Cedula] = [.cinquenta, .dez, .cinco, .dois]

print(saque(valor: valor, cedulasDisponiveis: cedulasDisponiveis))

