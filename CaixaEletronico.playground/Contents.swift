import UIKit

let cedulasDisponiveis = [50, 10, 5, 2]

func saque(valor: Int) -> String {
  if valor == 0 {
    return ""
  }

  for cedula in cedulasDisponiveis {
    if cedula <= valor {
      let resultadoParcial = saque(valor: valor - cedula)

      if resultadoParcial != "Não é possível realizar o saque." {
        return "\(cedula), \(resultadoParcial)"
      }
    }
  }

  return "Não é possível realizar o saque."
}

print(saque(valor: 205))
print(saque(valor: 75))
print(saque(valor: 30))
print(saque(valor: 600))
print(saque(valor: 8))




