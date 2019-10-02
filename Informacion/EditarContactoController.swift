//
//  EditarContactoController.swift
//  Informacion
//
//  Created by Luz on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    
    var contacto : Contacto?
    
    var callbackActualizarTabla : (() -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!

    override func viewDidLoad() {
        
        txtNombre.text = contacto!.nombre
        txtTelefono.text = contacto!.telefono
        
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        
        contacto?.nombre = txtNombre.text
        contacto?.telefono = txtTelefono.text
        
        callbackActualizarTabla!()
        
    }
    
}
