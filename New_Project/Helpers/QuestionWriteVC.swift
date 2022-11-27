//
//  QuestionWriteVC.swift
//  New_Project
//
//  Created by Sherzod on 24/11/22.
//

import UIKit

class QuestionWriteVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var textView: UITextView!
    @IBOutlet var countLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Savol yozish"
        textView.delegate = self
        textView.text = "Bu yerda sizning savolingiz"
        textView.textColor = UIColor.lightGray
        textView.layer.cornerRadius = 15
        textView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        
        textView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        if textView.contentSize.height > 130 {
            self.heightConstraint.constant = textView.contentSize.height
        }
        if textView.text.count == 0 {
            textView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        }
        
        self.countLbl.text = "\(textView.text.count)/1000"
        if textView.text.count == 1000 {
            textView.isEditable = false
        }
        
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Sarlovhani kiriting"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
}

