//
//  ItemCVC.swift
//  New_Project
//
//  Created by Sherzod on 26/11/22.
//

import UIKit

class ItemCVC: UICollectionViewCell {

    @IBOutlet var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AppealTVC", bundle: nil), forCellReuseIdentifier: "AppealTVC")
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

}

extension ItemCVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppealTVC", for: indexPath) as? AppealTVC else {return UITableViewCell()}
        
        return cell
    }
    
   
    
}
