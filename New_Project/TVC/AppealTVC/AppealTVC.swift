//
//  AppealTVC.swift
//  New_Project
//
//  Created by Sherzod on 26/11/22.
//

import UIKit

class AppealTVC: UITableViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var imgV: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var textLbl: UILabel!
    @IBOutlet var timelbl: UILabel!
    @IBOutlet var numberView: UIView!
    @IBOutlet var timeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    func setupViews() {
        containerView.layer.cornerRadius = 6
        containerView.layer.shadowColor = UIColor.systemGray3.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOpacity = 0.8
        
        numberView.layer.borderColor = UIColor.systemGray.cgColor
        numberView.layer.borderWidth = 1
        
        timeView.layer.borderColor = UIColor.systemGray.cgColor
        timeView.layer.borderWidth = 1
        
    }
    
    
}
