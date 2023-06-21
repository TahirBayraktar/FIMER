//
//  RequestViewController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 7.06.2023.
//

import UIKit

class RequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var reportTableView: UITableView!
    var chat = ["Şikayet ve Önerim 1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        reportTableView.delegate = self
        reportTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = chat[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toChatVC", sender: nil)
    }
    

}

