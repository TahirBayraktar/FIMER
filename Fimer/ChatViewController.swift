//
//  ChatViewController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 7.06.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    var msgArry = [String]()
    var senderby = [String]()
    var documentArrayId = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        messageTableView.delegate = self
        messageTableView.dataSource = self
        getMessage()
    }
    
    
    @IBAction func sendClickedBtn(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference : DocumentReference? = nil
        let firestorePost = ["senderby" : Auth.auth().currentUser!.email! , "text" : messageTextField.text!,"date" : FieldValue.serverTimestamp()] as [String:Any]
        firestoreReference = firestoreDatabase.collection("messages").addDocument(data: firestorePost,completion: { error in
            if error != nil {
                print("veri kaydetme başarısız")
            }else{
                self.messageTextField.text = " "
            }})
    }
    
    func getMessage(){
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("messages").order(by: "date", descending: false).addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription ?? "Error!")
                
            }else{
                if snapshot?.isEmpty != true  && snapshot != nil{
                    
                    self.msgArry.removeAll(keepingCapacity: false)
                    self.senderby.removeAll(keepingCapacity: false)
                    self.documentArrayId.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents{
                        let documentID = document.documentID
                        self.documentArrayId.append(documentID)
                        
                        if let postedBy = document.get("senderby") as? String{
                            self.senderby.append(postedBy)
                        }
                        if let postComment = document.get("text") as? String{
                            self.msgArry.append(postComment)
                        }
                        self.messageTableView.reloadData()
                    }
                }
            }
            
            
        }
    }
    
   

}
extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatTableViewCell
        cell.messageLabel.text = msgArry[indexPath.row]
        cell.userNameLabel.text = senderby[indexPath.row]
        return cell
    }
    
    
}
extension ChatViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
         return 100
    }
}
