//
//  ProfileViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/27/22.
//

import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var profileShortNameView: UIView!
    @IBOutlet weak var lblShortName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textFieldSocialMedia: UITextField!
    @IBOutlet weak var textFieldOccupation: UITextField!
    @IBOutlet weak var textFieldMaritialStatus: UITextField!
    @IBOutlet weak var textFieldFavouriteFood: UITextField!
    @IBOutlet weak var textFieldHobby: UITextField!
    @IBOutlet weak var textFieldAnyDislikes: UITextField!
    
    var placeholderText1 = "Did we miss something here?"
    var placeholderText2 = "Please share it here"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileShortNameView.layer.cornerRadius = profileShortNameView.layer.bounds.width / 2
        profileShortNameView.clipsToBounds = true
        textView.delegate = self
        textView.text = "\(placeholderText1) \n\(placeholderText2)"
        textView.textColor = ColorConstants.MainThemeColorConstants.primaryThemeColor
        textView.layer.cornerRadius = 20
        textView.layer.borderWidth = 1
        textView.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldSocialMedia.layer.cornerRadius = 20
        textFieldSocialMedia.layer.borderWidth = 1
        textFieldSocialMedia.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldOccupation.layer.cornerRadius = 20
        textFieldOccupation.layer.borderWidth = 1
        textFieldOccupation.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldMaritialStatus.layer.cornerRadius = 20
        textFieldMaritialStatus.layer.borderWidth = 1
        textFieldMaritialStatus.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldFavouriteFood.layer.cornerRadius = 20
        textFieldFavouriteFood.layer.borderWidth = 1
        textFieldFavouriteFood.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldHobby.layer.cornerRadius = 20
        textFieldHobby.layer.borderWidth = 1
        textFieldHobby.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        
        textFieldAnyDislikes.layer.cornerRadius = 20
        textFieldAnyDislikes.layer.borderWidth = 1
        textFieldAnyDislikes.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == ColorConstants.MainThemeColorConstants.primaryThemeColor {
            textView.text = ""
            textView.textColor = ColorConstants.MainThemeColorConstants.primaryThemeColor
        }
        
    }
}
