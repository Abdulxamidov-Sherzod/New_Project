//
//  PersonalInfoTVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit

class PersonalInfoTVC: UITableViewCell {

    @IBOutlet var tf: UITextField!
    @IBOutlet var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    func updateCell(title: String, tf: String) {
        self.lbl.text = title
        self.tf.text! = tf
    }
}
