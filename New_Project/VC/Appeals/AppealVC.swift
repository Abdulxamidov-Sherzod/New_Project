//
//  AppealVC.swift
//  New_Project
//
//  Created by Sherzod on 26/11/22.
//

import UIKit

class AppealVC: UIViewController {
    
    var selectRow: IndexPath!
    var selectedIndex: Int = 0
    var texts: [String] = ["Ko'rib chiqilmagan", "Ko'rib chiqilgan", "Qaytarib yuborilgan"]
    
    
    @IBOutlet var collectionView1: UICollectionView! {
        didSet {
            
            collectionView1.delegate = self
            collectionView1.dataSource = self
            collectionView1.register(UINib(nibName: "HeaderCVC", bundle: nil), forCellWithReuseIdentifier: "HeaderCVC")
            collectionView1.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        }
    }
    
    
    
    @IBOutlet var collectionView2: UICollectionView! {
        didSet {
            collectionView2.delegate = self
            collectionView2.dataSource = self
            collectionView2.register(UINib(nibName: "ItemCVC", bundle: nil), forCellWithReuseIdentifier: "ItemCVC")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Murojaatlar"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}


extension AppealVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView1 {
            return self.texts.count
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCVC", for: indexPath) as? HeaderCVC else {return UICollectionViewCell()}
            cell.lbl.text = self.texts[indexPath.row]
            if selectedIndex == indexPath.row {
                cell.bottomView.backgroundColor = .white
            } else {
                cell.bottomView.backgroundColor = UIColor.clear
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCVC", for: indexPath) as? ItemCVC else {return UICollectionViewCell()}
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView1 {
            return CGSize(width: self.texts[indexPath.row].widthOfStringg(usingFont: .systemFont(ofSize: 15)), height: 50)
        } else {
            let w = self.collectionView2.frame.width
            let h = self.collectionView2.frame.height
            
            return CGSize(width: w, height: h)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionView1 {
            selectedIndex = indexPath.row
            self.selectRow = indexPath
            print("selectedIndex =", selectedIndex)
            self.collectionView1.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView2.scrollToItem(at: IndexPath(row: indexPath.row, section: 0), at: .left, animated: true)
        } else {
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView1.reloadData()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(collectionView2.contentOffset.x/view.frame.width)
        selectedIndex = Int(pageIndex)
        print("selectedIndex =", selectedIndex)
        self.collectionView1.scrollToItem(at: IndexPath(row: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
        collectionView1.reloadData()
    }
}


///string size - content size
extension String {
    func widthOfStringg(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}


