//
//  ProfileVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var infoTexts: [String] = ["Shaxsiy ma'lumotlar", "Tilni o'zgartirish", "Ulashish", "Foydalanuvchi shartnomasi", "Ilova haqida", "Akkauntdan chiqish"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProfileInfoTVC", bundle: nil), forCellReuseIdentifier: "ProfileInfoTVC")
        tableView.register(UINib(nibName: "ProfileDataTableTVC", bundle: nil), forCellReuseIdentifier: "ProfileDataTableTVC")
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoTVC", for: indexPath) as? ProfileInfoTVC else {return UITableViewCell()}
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDataTableTVC", for: indexPath) as? ProfileDataTableTVC else {return UITableViewCell()}
            cell.updateCell(text: self.infoTexts[indexPath.row], img: "person")
            if indexPath.row == self.infoTexts.count - 1 {
                cell.lbl.textColor = .red
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 2 {
                //Set the default sharing message.
                let message = "Message goes here."
                //Set the link to share.
                if let link = NSURL(string: "http://yoururl.com")
                {
                    let objectsToShare = [message,link] as [Any]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                    self.present(activityVC, animated: true, completion: nil)
                }
            } else if indexPath.row == 0 {
                let vc = PersonalInformationVC()
                navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 4 {
                let vc = AutorisationVC()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
