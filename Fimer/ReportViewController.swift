//
//  ReportViewController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 21.06.2023.
//

import UIKit

class ReportViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBAction func imageAddBtn(_ sender: Any) {
        let picker=UIImagePickerController()
            picker.delegate=self
    //      nereden fotograf secicez onu seciyoz
            picker.sourceType  = .photoLibrary
    //      düzenlenmesini sağlıyoz
            picker.allowsEditing=true
    //      pickerımızı göster
            present(picker, animated: true, completion: nil)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    
}
