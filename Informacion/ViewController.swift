//
//  ViewController.swift
//  Informacion
//
//  Created by Luz on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contactos : [Contacto] = []
    
    @IBOutlet weak var tvContactos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactos.append(Contacto(nombre: "Maria Zayas", telefono: "(658) 9 42 13 10", direccion: "Calle muerta 01", correo: "hola@gmail.com", foto: "foto1.jpeg"))
        contactos.append(Contacto(nombre: "Liliana Cota", telefono: "(456) 8 97 12 01", direccion: "#8 colimas", correo: "ahdr@gmail.com", foto: "foto2.jpeg"))
        contactos.append(Contacto(nombre: "Pancha Lopez", telefono: "(662) 4 23 12 00", direccion: "#45 Moderna", correo: "opa@gmail.com", foto: "foto3.jpeg"))
        contactos.append(Contacto(nombre: "Paco Ortiz", telefono: "(856) 1 32 10 01", direccion: "Francia", correo: "pp@gmail.com", foto: "foto4.png"))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactos.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre! //el signo ! es porque va a traer algo
        celda?.lblTelefono.text = contactos[indexPath.row].telefono
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 136
    
    }
    
    func recargarTabla(){
        
        tvContactos.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToEditar"{
            
            let destino = segue.destination as? EditarContactoController
            
            destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            
            destino?.callbackActualizarTabla = recargarTabla
            
        }
        
    }
    
    
    
}
