//
//  MainVC.swift
//  New_Project
//
//  Created by Sherzod on 24/11/22.
//

import UIKit

class QuestionAnswersVC: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Savol javoblar"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "QuestionAnswersTVC", bundle: nil), forCellReuseIdentifier: "QuestionAnswersTVC")
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    @IBAction func writeBtnPessed(_ sender: UIButton) {
        let vc = QuestionWriteVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension QuestionAnswersVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionAnswersTVC", for: indexPath) as? QuestionAnswersTVC else {return UITableViewCell()}
        cell.updateCell(personImg: "person", personName: "Sherzod", personChat: "Salom. Ushbu mahsulotdan qanday foydalansam bo‘ladi bazi bir mu’ammolar yuzaga kelmoqda ?", isSeller: false, sellerChat: "Salom! Sizning ushbu murojatingiz bo‘yicha operatorlarimiz tez orada javob berishadi. murojatingiz bo‘yicha operatorlarimiz tez orada javob berishadi. murojatingiz bo‘yicha operatorlarimiz tez orada javob berishadi.")
        return cell
    }
    
}
