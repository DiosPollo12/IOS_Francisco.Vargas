//
//  Usuario.swift
//  Activity_9
//
//  Created by Alumno on 8/4/26.
//

import Foundation

class Usuario {
    public var nombre: String
    public var email: String
    private var password: String
    private(set) var activo: Bool
    
    init(nombre: String, email: String, password: String, activo: Bool = true) {
        self.nombre = nombre
        self.email = email
        self.password = password
        self.activo = activo
    }
    
    convenience init(nombre: String, email: String) {
        self.init(nombre: nombre, email: email, password: "default123")
    }
    
    func login(password: String) -> Bool {
        return activo && self.password == password
    }
    
    func cambiarPassword(actual: String, nueva: String) -> Bool {
        guard actual == password else {
            print("[ERROR] Contrasena actual incorrecta")
            return false
        }
        guard nueva.count >= 6 else {
            print("[ERROR] Minimo 6 caracteres")
            return false
        }
        password = nueva
        print("[OK] Contrasena actualizada")
        return true
    }
    
    func activar() {
        activo = true
        print("[INFO] \(nombre) activado")
    }
    
    func desactivar() {
        activo = false
        print("[INFO] \(nombre) desactivado")
    }
    
    func descripcion() {
        print("Nombre: \(nombre) | Email: \(email) | Estado: \(activo ? "Activo" : "Inactivo")")
    }
    
    internal func resetearPassword(_ nueva: String) -> Bool {
        guard nueva.count >= 6 else { return false }
        password = nueva
        return true
    }
}
