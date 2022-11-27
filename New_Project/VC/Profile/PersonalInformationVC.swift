//
//  PersonalInformationVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit

class PersonalInformationVC: UIViewController {
    
    
    var datesTexts: [String] = ["Ism", "Familiya", "Tug'ilgan sana", "Jinsi", "Yashash manzili", "Telefon raqam"]
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    func setupViews() {
        title = "Shaxsiy ma'lumotlar"
        self.navigationController?.navigationBar.tintColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PersonalInfoTVC", bundle: nil), forCellReuseIdentifier: "PersonalInfoTVC")
    }
    
}

extension PersonalInformationVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTVC", for: indexPath) as? PersonalInfoTVC else {return UITableViewCell()}
        cell.updateCell(title: self.datesTexts[indexPath.row], tf: self.datesTexts[indexPath.row])
        return cell
    }
    
}
