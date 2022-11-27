//
//  QuestionAnswersTVC.swift
//  New_Project
//
//  Created by Sherzod on 24/11/22.
//

import UIKit

class QuestionAnswersTVC: UITableViewCell {
    
    @IBOutlet var personImg: UIImageView!
    @IBOutlet var personName: UILabel!
    @IBOutlet var personChat: UILabel!
    @IBOutlet var sellerChat: UILabel!
    @IBOutlet var sellerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sellerView.layer.cornerRadius = 5
        sellerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        sellerView.layer.masksToBounds = true
    }
    
    func updateCell(personImg: String, personName: String, personChat: String, isSeller: Bool, sellerChat: String) {
        self.personImg.image = UIImage(named: personImg)
        self.personName.text! = personName
        self.personChat.text! = personChat
        self.sellerChat.text! = sellerChat
        self.sellerView.isHidden = isSeller
    }
    
}
