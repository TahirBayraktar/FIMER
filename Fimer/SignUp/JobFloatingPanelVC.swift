//
//  JobFloatingPanelVC.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 26.05.2023.
//

import UIKit
import FloatingPanel

class JobFloatingPanelVC: UIViewController,UITableViewDataSource {
    
    

    @IBOutlet weak var jobsTableView: UITableView!
    let jobsArray = [
        "Öğrenci",
        "Öğretim Üyesi",
        "Rektörlük",
        "Vatandaş",
        "Hastane Çalışanı",
        "Dış Paydaşlar"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobsTableView.delegate = self
        jobsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jobsArray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = jobsTableView.dequeueReusableCell(withIdentifier: "jobsCell",for: indexPath) as! JobPanelTableViewCell
        cell.jobsLabel.text = jobsArray[indexPath.row]
        return cell
    }


}
extension JobFloatingPanelVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedText = jobsArray[indexPath.row]
        
        if let parentViewController = self.parent?.parent as? SignUpVController{
           
            parentViewController.jobsButton.setTitle(selectedText, for: [])
            
            if let floatingPanelController = self.parent as? FloatingPanelController {
                floatingPanelController.dismiss(animated: true, completion: nil)
            }
            
        }
        
        
       
    }
    
}
