//
//  HomePageTableViewCell.swift
//  Fimer
//
//  Created by Tahir Bayraktar on 31.05.2023.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var homePageImageView: UIImageView!

    @IBOutlet weak var homeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
