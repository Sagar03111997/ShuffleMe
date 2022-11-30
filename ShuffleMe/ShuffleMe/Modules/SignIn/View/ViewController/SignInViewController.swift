//
//  SignInViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/23/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignInViewController: UIViewController {
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    let underLine: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doInitailSetup()
    }
    
    func doInitailSetup() {
//        btnSignIn.layer.cornerRadius = 20.0
//        btnSignIn.tintColor = ColorConstants.MainThemeColorConstants.secondaryLegendColor
        textFieldSetup()
        let attributeString = NSMutableAttributedString(
           string: "Forgot Password?",
           attributes: underLine
        )
        btnForgotPassword.setAttributedTitle(attributeString, for: .normal)
    }
    
    func textFieldSetup() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x:0, y: txtFieldEmail.frame.height - 2, width: txtFieldEmail.frame.width, height: 2)
        bottomLine.backgroundColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        txtFieldEmail.borderStyle = .none
        txtFieldEmail.layer.addSublayer(bottomLine)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x:0, y: txtFieldPassword.frame.height - 2, width: txtFieldPassword.frame.width, height: 2)
        bottomLine2.backgroundColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        txtFieldPassword.borderStyle = .none
        txtFieldPassword.layer.addSublayer(bottomLine2)
    }
    
    @IBAction func btnSignInTapped(_ sender: Any) {
    
        if txtFieldEmail.text == "" {
            print("Email cannot be empty")
        }
        
        if txtFieldPassword.text == "" {
            print("Password cannot be empty")
        }
        
        guard let email = txtFieldEmail.text else {
            return
        }
        
        guard let password = txtFieldPassword.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {  (authResult, error) in
            guard error != nil else {
                debugPrint("Error", error?.localizedDescription ?? "")
                return
            }
            let storyboard = UIStoryboard.init(name: "AllSet", bundle: nil)
            guard let allSet = storyboard.instantiateViewController(withIdentifier: "AllSetViewController") as? AllSetViewController else { return }
            allSet.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            allSet.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(allSet, animated: false, completion: nil)
        }
        
    }
    
    
    @IBAction func btnForgotPassword(_ sender: Any) {
        if txtFieldEmail.text == "" {
            print("Email cannot be empty")
        }
        
        Auth.auth().sendPasswordReset(withEmail: txtFieldEmail.text ?? "") { (error) in
            guard let error = error else {
                debugPrint("Error", error?.localizedDescription ?? "")
                return
            }
        }
        
    }

}
