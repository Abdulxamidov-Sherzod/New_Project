//
//  ProfileDataTableTVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit

class ProfileDataTableTVC: UITableViewCell {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var imgV: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(text: String, img: String) {
        self.imgV.image = UIImage(named: img)
        self.lbl.text = text
    }

}
