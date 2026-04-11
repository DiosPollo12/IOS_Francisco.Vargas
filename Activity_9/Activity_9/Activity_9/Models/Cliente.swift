//
//  Cliente.swift
//  Activity_9
//
//  Created by Alumno on 8/4/26.
//

import Foundation

class Cliente: Usuario {
    private var saldo: Double
    internal var historialCompras: [String] = []
    
    init(nombre: String, email: String, password: String, saldoInicial: Double = 0) {
        self.saldo = max(0, saldoInicial)
        super.init(nombre: nombre, email: email, password: password)
    }
    
    convenience init(nombre: String, email: String) {
        self.init(nombre: nombre, email: email, password: "cliente123")
    }
    
    func depositar(_ cantidad: Double) {
        guard cantidad > 0 else {
            print("[ERROR] Cantidad invalida")
            return
        }
        saldo += cantidad
        print("[OK] Deposito: +$\(cantidad). Saldo: $\(saldo)")
    }
    
    func comprar(producto: String, precio: Double) {
        guard activo else {
            print("[ERROR] Usuario inactivo")
            return
        }
        guard saldo >= precio else {
            print("[ERROR] Saldo insuficiente. Saldo: $\(saldo), Necesita: $\(precio)")
            return
        }
        
        saldo -= precio
        historialCompras.append("\(producto) - $\(precio)")
        print("[OK] Compra: \(producto) por $\(precio). Saldo restante: $\(saldo)")
    }
    
    func verSaldo() -> Double {
        print("Saldo: $\(saldo)")
        return saldo
    }
    
    override func descripcion() {
        super.descripcion()
        print("Rol: Cliente | Saldo: $\(saldo) | Compras: \(historialCompras.count)")
        if !historialCompras.isEmpty {
            for compra in historialCompras {
                print("  - \(compra)")
            }
        }
    }
}
