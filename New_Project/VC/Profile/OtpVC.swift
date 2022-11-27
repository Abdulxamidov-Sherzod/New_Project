//
//  OtpVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit

class OtpVC: UIViewController {
    
    @IBOutlet var otpView: UIView!
    @IBOutlet var otpLbl: UILabel!
    @IBOutlet var otpMessageLbl: UILabel!
    @IBOutlet var confirmLbl: UILabel!
    @IBOutlet var dataLbl: UILabel!
    @IBOutlet var isSuccessLbl: UILabel!
    @IBOutlet var againSubmitlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        againSubmitlbl.isUserInteractionEnabled = true
        againSubmitlbl.addGestureRecognizer(tap)
    }
    
    override func viewDidLayoutSubviews() {
        self.otpView.layer.cornerRadius = 20
        self.otpView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        let vc = RegisterPersonalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
}
