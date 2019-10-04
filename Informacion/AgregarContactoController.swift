//
//  AgregarContactoController.swift
//  Informacion
//
//  Created by Alumno on 10/4/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class AgregarContactoController : UIViewController{
    
    var contacto : Contacto?
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    var callbackActualizarTabla : (() -> Void)?
    var callbackAgregar : (() -> Void)?
    
    override func viewDidLoad() {
        
       /*txtNombre.text = contacto!.nombre
        txtTelefono.text = contacto!.telefono*/
        
        
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {

        contacto?.nombre = txtNombre.text
        contacto?.telefono = txtTelefono.text
        
        callbackActualizarTabla!()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
