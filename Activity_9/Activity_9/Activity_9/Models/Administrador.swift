//
//  Administrador.swift
//  Activity_9
//
//  Created by Alumno on 8/4/26.
//

import Foundation

class Administrador: Usuario {
    var nivelAcceso: Int
    
    init(nombre: String, email: String, password: String, nivelAcceso: Int) {
        self.nivelAcceso = nivelAcceso
        super.init(nombre: nombre, email: email, password: password)
    }
    
    convenience init(nombre: String, email: String, nivelAcceso: Int) {
        self.init(nombre: nombre, email: email, password: "admin123", nivelAcceso: nivelAcceso)
    }
    
    override func descripcion() {
        super.descripcion()
        print("Rol: Administrador | Nivel: \(nivelAcceso)")
    }
    
    func eliminarUsuario(_ usuario: Usuario) {
        guard nivelAcceso >= 5 else {
            print("[ERROR] Acceso denegado (nivel \(nivelAcceso) < 5)")
            return
        }
        usuario.desactivar()
        print("[OK] Usuario \(usuario.nombre) eliminado del sistema")
    }
    
    func resetearPassword(usuario: Usuario, nueva: String) {
        guard nivelAcceso >= 3 else {
            print("[ERROR] Acceso denegado (nivel \(nivelAcceso) < 3)")
            return
        }
        if usuario.resetearPassword(nueva) {
            print("[OK] Contrasena de \(usuario.nombre) reseteada exitosamente")
        } else {
            print("[ERROR] La nueva contrasena debe tener al menos 6 caracteres")
        }
    }
}
