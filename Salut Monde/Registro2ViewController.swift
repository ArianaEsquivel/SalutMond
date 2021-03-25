//
//  Registro2ViewController.swift
//  Salut Monde
//
//  Created by Ariana Esquivel on 24/03/21.
//

import UIKit

class Registro2ViewController: UIViewController {

   
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    @IBOutlet weak var tfConfirmContrasena: UITextField!
    @IBOutlet weak var btnRegistrarse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Registrarse(_ sender: Any) {
        let Usuario : String = tfUsuario.text ?? ""
        let Correo : String = tfCorreo.text ?? ""
        let Contrasena : String = tfContrasena.text ?? ""
        let ConfirmContrasena : String = tfConfirmContrasena.text ?? ""
        
        if Contrasena == ConfirmContrasena {
            let registro = Registro(first_name: Registro.nombre, last_name: Registro.appa, second_last_name: Registro.apma, username: Usuario, email: Correo, password: Contrasena)
            let postRequest = APIRequest(endpoint: "signup")
            postRequest.save(registro) { (result) in
                switch result {
                case .success(let registro):
                    print("Usuario \(String(describing: registro.first_name)) registrado")
                case .failure(let err):
                    print(err)
                    
                }
            }
        }
        else {
            self.alertDefault(with: "Contraseña incorrecta", andWithMsg: "Verifique que la contraseña sea la misma en ambos campos")
        }
        
    }
    
}

extension UIViewController{
    func alertDefault(with title:String, andWithMsg description:String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(a) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}
