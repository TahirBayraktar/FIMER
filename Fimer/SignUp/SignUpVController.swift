//
//  SignUpVController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 26.05.2023.
//

import UIKit
import FloatingPanel
import FirebaseAuth

class SignUpVController: UIViewController,FloatingPanelControllerDelegate {
    
    let fpc = FloatingPanelController()
    
    @IBOutlet weak var signUpEPostaTextField: UITextField!
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    @IBOutlet weak var signUpAgainPasswordTextField: UITextField!
    
    @IBOutlet weak var jobsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    ----Meslek şeçim paneli----FloatingPanel---
    @IBAction func jobPanelOpenClickedButton(_ sender: Any) {
        fpc.delegate = self
        guard let contentVC = storyboard?.instantiateViewController(identifier: "fpc_content") as? JobFloatingPanelVC else {
            return
        }
        fpc.set(contentViewController: contentVC)
        fpc.isRemovalInteractionEnabled = true
        fpc.addPanel(toParent: self)
    }
//    -------Alert Message--------
    func makeAlert(tittleInput:String,messageInput:String){
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
        
    }

//    ------Kayıt ol------
    @IBAction func signUpClickedButton(_ sender: Any) {
        
        if jobsButton.title(for: .normal) == "Meslek"{
            makeAlert(tittleInput: "Error!", messageInput: "Lütfen meslek şeçiniz.")
        }else{
            if signUpPasswordTextField.text != signUpAgainPasswordTextField.text{
                
                makeAlert(tittleInput: "Error!", messageInput: "Hatalı şifre tekrar giriniz.")
                
            }else{
                
                if signUpEPostaTextField.text != "" && signUpPasswordTextField.text != ""{
                    
                    
                    Auth.auth().createUser(withEmail: signUpEPostaTextField.text!, password: signUpPasswordTextField.text!) { AuthDataResult, error in
                        
                        if error != nil{
                            self.makeAlert(tittleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                            //    burda kaldım
                        }else{
                            
                            self.makeAlert(tittleInput: "Başarılı", messageInput: "Kaydınız başarılı giriş sayfasına gidiniz.")
                        }
                    }
                }else{
                    self.makeAlert(tittleInput: "Error!", messageInput: "error")
                }
                
                
            }
        }
    }
}

