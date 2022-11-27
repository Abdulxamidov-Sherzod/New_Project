//
//  AutorisationVC.swift
//  New_Project
//
//  Created by Sherzod on 25/11/22.
//

import UIKit
import SwiftPhoneNumberFormatter

class AutorisationVC: UIViewController {
    
    
    
    var isDone: Bool = false
    @IBOutlet var autorisationLbl: UILabel!
    @IBOutlet var serviceLbl: UILabel!
    @IBOutlet var phoneNumberView: UIView!
    @IBOutlet var phoneNumberTf: PhoneFormattedTextField! {
        didSet {
            phoneNumberTf.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(##) ### ## ##")
            phoneNumberTf.prefix = ""
        }
    }
    
    @IBOutlet var phoneNumberLbl: UILabel!
    @IBOutlet var doneBtn: UIButton!
    @IBOutlet var doneLbl: UILabel!
    
    @IBOutlet var submitBtn: UIButton!
    let selectableString1 = "foydalanuvchilar kelishuvi"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        
        setupViews()
        let text = "Men \(selectableString1) shartlari bilan tanishdim va ularga roziman"
        doneLbl.attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: text))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        doneLbl.addGestureRecognizer(tapGesture)
        doneLbl.isUserInteractionEnabled = true
        
        let attributedWithTextColor: NSAttributedString = "Men \(selectableString1) shartlari bilan tanishdim va ularga roziman".attributedStringWithColor(["\(selectableString1)"], color: UIColor.link)

        doneLbl.attributedText = attributedWithTextColor
        
    }
    
    
    @objc func labelTapped(gesture: UITapGestureRecognizer) {
        
        if gesture.didTapAttributedString(selectableString1, in: doneLbl) {
            
            print("\(selectableString1) tapped")
            
        } else {
            
            print("Text tapped")
        }
    }
    
    
    
    
    
    
    
    
    func setupViews() {
        self.submitBtn.backgroundColor = #colorLiteral(red: 0.006716270931, green: 0.466093719, blue: 0.7430582643, alpha: 0.6971233444)
        self.submitBtn.isUserInteractionEnabled = false
    }
    
    override func viewDidLayoutSubviews() {
        self.phoneNumberView.layer.cornerRadius = 20
        self.phoneNumberView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.doneBtn.layer.borderWidth = 3
        self.doneBtn.layer.cornerRadius = 15
        self.doneBtn.layer.borderColor = #colorLiteral(red: 0.006716270931, green: 0.466093719, blue: 0.7430582643, alpha: 1)
        self.submitBtn.layer.cornerRadius = 25
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
        
        self.isDone = !self.isDone
        
        if isDone {
            self.submitBtn.isUserInteractionEnabled = true
            self.submitBtn.backgroundColor = #colorLiteral(red: 0.006716270931, green: 0.466093719, blue: 0.7430582643, alpha: 1)
            self.doneBtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
            self.doneBtn.tintColor = .white
            self.doneBtn.backgroundColor = #colorLiteral(red: 0.006716270931, green: 0.466093719, blue: 0.7430582643, alpha: 1)
        } else {
            self.submitBtn.isUserInteractionEnabled = false
            self.submitBtn.backgroundColor = #colorLiteral(red: 0.006716270931, green: 0.466093719, blue: 0.7430582643, alpha: 0.6971233444)
            self.doneBtn.setImage(UIImage(systemName: ""), for: .normal)
            self.doneBtn.tintColor = .white
            self.doneBtn.backgroundColor = .clear
        }
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        let vc = OtpVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}


extension UITapGestureRecognizer {
    
    func didTapAttributedString(_ string: String, in label: UILabel) -> Bool {
        
        guard let text = label.text else {
            
            return false
        }
        
        
        let range = (text as NSString).range(of: string)
        return self.didTapAttributedText(label: label, inRange: range)
    }
    
    private func didTapAttributedText(label: UILabel, inRange targetRange: NSRange) -> Bool {
        
        guard let attributedText = label.attributedText else {
            
            assertionFailure("attributedText must be set")
            return false
        }
        
        let textContainer = createTextContainer(for: label)
        
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        if let font = label.font {
            
            textStorage.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(0, attributedText.length))
        }
        textStorage.addLayoutManager(layoutManager)
        
        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let alignmentOffset = aligmentOffset(for: label)
        
        let xOffset = ((label.bounds.size.width - textBoundingBox.size.width) * alignmentOffset) - textBoundingBox.origin.x
        let yOffset = ((label.bounds.size.height - textBoundingBox.size.height) * alignmentOffset) - textBoundingBox.origin.y
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - xOffset, y: locationOfTouchInLabel.y - yOffset)
        
        let characterTapped = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        let lineTapped = Int(ceil(locationOfTouchInLabel.y / label.font.lineHeight)) - 1
        let rightMostPointInLineTapped = CGPoint(x: label.bounds.size.width, y: label.font.lineHeight * CGFloat(lineTapped))
        let charsInLineTapped = layoutManager.characterIndex(for: rightMostPointInLineTapped, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return characterTapped < charsInLineTapped ? targetRange.contains(characterTapped) : false
    }
    
    private func createTextContainer(for label: UILabel) -> NSTextContainer {
        
        let textContainer = NSTextContainer(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        return textContainer
    }
    
    private func aligmentOffset(for label: UILabel) -> CGFloat {
        
        switch label.textAlignment {
            
        case .left, .natural, .justified:
            
            return 0.0
        case .center:
            
            return 0.5
        case .right:
            
            return 1.0
            
        @unknown default:
            
            return 0.0
        }
    }
}


extension String {
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        guard let characterSpacing = characterSpacing else {return attributedString}
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
}





