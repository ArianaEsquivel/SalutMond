//
//  Registro1ViewController.swift
//  Salut Monde
//
//  Created by Ariana Esquivel on 24/03/21.
//

import UIKit

class Registro1ViewController: UIViewController {


    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfApPat: UITextField!
    @IBOutlet weak var tfApMat: UITextField!
    @IBOutlet weak var btnContinuar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Continuar(_ sender: Any) {
        Registro.nombre = tfNombre.text ?? ""
        Registro.appa = tfApPat.text ?? ""
        Registro.apma = tfApMat.text ?? ""
        
    }
    
}
