//
//  RegisterPersonalVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit


class RegisterPersonalVC: UIViewController {
    
    
    @IBOutlet var registerLbl: UILabel!
    @IBOutlet var personalLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var nameTf: UITextField!
    @IBOutlet var surNameLbl: UILabel!
    @IBOutlet var surNameTf: UITextField!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var dateTf: UITextField!
    @IBOutlet var genderLbl: UILabel!
    @IBOutlet var infoView: UIView!
    @IBOutlet var genderTf: UITextField!
    @IBOutlet var confirmBtn: UIButton!
    
    
    let pickerView: UIPickerView = UIPickerView()
    let pickers: [String] = ["Erkak", "Ayol"]
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.genderTf.inputView = pickerView
        showDatePicker()
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.infoView.layer.cornerRadius = 20
        self.infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        let vc = RegisterLocationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
    
}

//MARK: - Date Picker
extension RegisterPersonalVC {
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateTf.inputAccessoryView = toolbar
        dateTf.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTf.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            self.dateTf.text! = "\(day)/\(month)/\(year)"
        }
    }
    
    
}



//MARK: - UIPICKERVIEW METHODS
extension RegisterPersonalVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.pickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderTf.text! = self.pickers[row]
    }
}
