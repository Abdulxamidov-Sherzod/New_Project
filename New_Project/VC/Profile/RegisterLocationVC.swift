//
//  RegisterLocationVC.swift
//  New_Project
//
//  Created by Sherzod on 26/11/22.
//

import UIKit

class RegisterLocationVC: UIViewController {
    
    @IBOutlet var registerLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var regionLbl: UILabel!
    @IBOutlet var regionTf: UITextField!
    @IBOutlet var mfyLbl: UILabel!
    @IBOutlet var mfyTf: UITextField!
    @IBOutlet var addLocationLbl: UILabel!
    @IBOutlet var addLocationlbl: UITextView!
    @IBOutlet var confirmBtn: UIButton!
    @IBOutlet var textView: UITextView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    let pickerRegion: UIPickerView = UIPickerView()
    let pickerMFY: UIPickerView = UIPickerView()
    let pickerRegionDates: [String] = ["1", "2", "3"]
    let pickerMFYDates: [String] = ["4", "5", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerRegion.delegate = self
        pickerRegion.dataSource = self
        regionTf.inputView = pickerRegion
        
        pickerMFY.delegate = self
        pickerMFY.dataSource = self
        mfyTf.inputView = pickerMFY
        
        textView.delegate = self
        textView.text = "Ixtiyoriy"
        textView.textColor = UIColor.lightGray
        textView.layer.cornerRadius = 6
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterLocationVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height > 110 {
            self.heightConstraint.constant = textView.contentSize.height
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


//MARK: - UIPICKERVIEW METHODS
extension RegisterLocationVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerRegion {
            return self.pickerRegionDates.count
        } else {
            return self.pickerMFYDates.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerRegion {
            return self.pickerRegionDates[row]
        } else {
            return self.pickerMFYDates[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerRegion {
            self.regionTf.text! = pickerRegionDates[row]
        } else {
            self.mfyTf.text! = pickerMFYDates[row]
        }
    }
}


