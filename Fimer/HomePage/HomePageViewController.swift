//
//  HomePageViewController.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 31.05.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var homePageTableView: UITableView!
    var imageArray = [UIImage]()
    var titleArray = [
        "Teknoloji Fakültesi",
        "Mühendislik Fakültesi",
        "Sağlık Bilimleri Fakültesi",
        "Eğitim Fakültesi"
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homePageTableView.delegate = self
        homePageTableView.dataSource = self
        
        imageArray.append(UIImage(named: "teknolojiImage")!)
        imageArray.append(UIImage(named: "muhendislikImage")!)
        imageArray.append(UIImage(named: "saglikImage")!)
        imageArray.append(UIImage(named: "egitimImage")!)
       
    }
    
    

   

}
extension HomePageViewController:UITableViewDelegate{
    
}
extension HomePageViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = homePageTableView.dequeueReusableCell(withIdentifier: "toHomePageVC") as! HomePageTableViewCell
        cell.homePageImageView.image = imageArray[indexPath.row]
        cell.homeTitleLabel.text = titleArray[indexPath.row]
        return cell
    }
}
