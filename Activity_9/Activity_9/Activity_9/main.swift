//
//  main.swift
//  Activity_9
//
//  Created by Alumno on 8/4/26.
//

import Foundation

print("=" * 50)
print("SISTEMA DE USUARIOS - ACTIVITY_9")
print("=" * 50)

// Crear usuarios con tus datos
let admin = Administrador(nombre: "Adrian Estrada", email: "adrian@admin.com", password: "admin123", nivelAcceso: 5)
let cliente = Cliente(nombre: "Adrian Estrada", email: "alan@gmail.com", password: "cliente123", saldoInicial: 10000)

print("\n--- USUARIOS CREADOS ---")
admin.descripcion()
cliente.descripcion()

// Probar metodos de Usuario
print("\n--- METODOS DE USUARIO ---")
print("Login cliente: \(cliente.login(password: "cliente123"))")
print("Login cliente (mal): \(cliente.login(password: "wrong"))")
cliente.cambiarPassword(actual: "cliente123", nueva: "nuevaClave6")
cliente.cambiarPassword(actual: "cliente123", nueva: "corta")

// Probar metodos de Cliente
print("\n--- METODOS DE CLIENTE ---")
cliente.verSaldo()
cliente.depositar(500)
cliente.comprar(producto: "MacBook Pro", precio: 2500)
cliente.comprar(producto: "iPhone 15", precio: 1200)
cliente.comprar(producto: "iPad", precio: 800)

// Probar metodos de Administrador
print("\n--- METODOS DE ADMINISTRADOR ---")
admin.resetearPassword(usuario: cliente, nueva: "secreta789")
admin.eliminarUsuario(cliente)

// Estado final
print("\n--- ESTADO FINAL ---")
print("Administrador:")
admin.descripcion()
print("\nCliente:")
cliente.descripcion()

print("\n" + "=" * 50)
print("DEMOSTRACION COMPLETADA")
print("=" * 50)

func * (str: String, count: Int) -> String {
    return String(repeating: str, count: count)
}
