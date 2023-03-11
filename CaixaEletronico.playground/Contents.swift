struct Nota {
    let valor: Int
    var quantidade: Int
}

let notasDisponiveis = [Nota(valor: 50, quantidade: 3), Nota(valor: 10, quantidade: 3), Nota(valor: 5, quantidade: 3), Nota(valor: 2, quantidade: 3)]

func saque(valor: Int, estoque: [Nota]) -> String {
    var valor = valor
    var estoque = estoque
    if valor < 0 {
        return "Não é possível realizar o saque."
    }
    
    if valor == 0 {
        return ""
    }
    
    var resultado: [String] = []
    
    for i in 0..<notasDisponiveis.count {
        let nota = notasDisponiveis[i]
        var count = 0
        
        while valor >= nota.valor && estoque[i].quantidade > 0 {
            valor -= nota.valor
            estoque[i].quantidade -= 1
            count += 1
        }
        
        if count > 0 {
            resultado.append("\(nota.valor)x\(count)")
        }
    }
    
    if valor == 0 {
        return resultado.joined(separator: " | ")
    } else {
        // adiciona as notas retiradas de volta no estoque
        for i in 0..<notasDisponiveis.count {
            let nota = notasDisponiveis[i]
            estoque[i].quantidade += (resultado.filter{ $0.contains("\(nota.valor)") }.count)
        }
        return "Não é possível realizar o saque."
    }
}

print(saque(valor: 20, estoque: notasDisponiveis))
print(saque(valor: 205, estoque: notasDisponiveis))
print(saque(valor: 75, estoque: notasDisponiveis))
print(saque(valor: 30, estoque: notasDisponiveis))
print(saque(valor: 600, estoque: notasDisponiveis))
print(saque(valor: 8, estoque: notasDisponiveis))
print(saque(valor: 5, estoque: notasDisponiveis))
