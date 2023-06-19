//
//  ViewController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 5.05.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

   
    @IBOutlet weak var signInMailTextField: UITextField!
    @IBOutlet weak var signInPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

//  -----Giriş yap-----
    @IBAction func signInClickedButton(_ sender: Any) {
        if signInMailTextField.text != "" && signInPasswordTextField.text != ""{
            Auth.auth().signIn(withEmail: signInMailTextField.text!, password: signInPasswordTextField.text!) { AuthDataResult, Error in
                if Error != nil{
                    self.makeAlert(tittleInput: "Error!", messageInput: Error?.localizedDescription ?? "error")
                }else{
                    self.performSegue(withIdentifier: "toHomePageVC", sender: nil)
                }
            }
        }
        else{
            makeAlert(tittleInput: "Error!", messageInput: "Eposta/Password?")
        }
        
    }
//    ------Alert Message-----
    func makeAlert(tittleInput:String,messageInput:String){
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
        
    }
}

