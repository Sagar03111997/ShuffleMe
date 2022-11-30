//
//  SignUpViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/25/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetup()
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
        
        let bottomLine3 = CALayer()
        bottomLine3.frame = CGRect(x:0, y: txtFieldPassword.frame.height - 2, width: txtFieldFirstName.frame.width, height: 2)
        bottomLine3.backgroundColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        txtFieldFirstName.borderStyle = .none
        txtFieldFirstName.layer.addSublayer(bottomLine3)
        
        let bottomLine4 = CALayer()
        bottomLine4.frame = CGRect(x:0, y: txtFieldLastName.frame.height - 2, width: txtFieldLastName.frame.width, height: 2)
        bottomLine4.backgroundColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        txtFieldLastName.borderStyle = .none
        txtFieldLastName.layer.addSublayer(bottomLine4)
        
        let bottomLine5 = CALayer()
        bottomLine5.frame = CGRect(x:0, y: txtFieldPhoneNumber.frame.height - 2, width: txtFieldPhoneNumber.frame.width, height: 2)
        bottomLine5.backgroundColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
        txtFieldPhoneNumber.borderStyle = .none
        txtFieldPhoneNumber.layer.addSublayer(bottomLine5)
    }
    
    
    @IBAction func btnSignInTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "SignIn", bundle: nil)
        guard let signIn = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signIn.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        signIn.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(signIn, animated: false, completion: nil)
    }
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        guard txtFieldFirstName.text != "" else {
            print("First Name Empty")
            return
        }
        
        if txtFieldLastName.text == "" {
            print("Last Name cannot be empty")
        }
        
        if txtFieldPhoneNumber.text == "" {
            print("Phone number cannot be empty")
        }
        
        if txtFieldEmail.text == "" {
            print("Email cannot be empty")
        } else if !isValidEmailAddr(email: txtFieldEmail.text ?? "") {
            UtilityMethods.sharedInstance.showSimpleAlertViewWith(alertTitle: "Invalid Email", alertMessage: "Please enter a valid email")
        }
        
        if txtFieldPassword.text == "" {
            print("Password cannot be empty")
        } else if txtFieldPassword.text?.count ?? 0 < 6 {
            UtilityMethods.sharedInstance.showSimpleAlertViewWith(alertTitle: "Invalid Password Choice", alertMessage: "Please enter a password more than 6 characters")
        }
        
        Auth.auth().createUser(withEmail: txtFieldEmail.text ?? "", password: txtFieldPassword.text ?? "") { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                debugPrint("Error \(String(describing: error?.localizedDescription))")
                return
            }
            let storyboard = UIStoryboard.init(name: "AllSet", bundle: nil)
            guard let allSet = storyboard.instantiateViewController(withIdentifier: "AllSetViewController") as? AllSetViewController else { return }
            allSet.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            allSet.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(allSet, animated: false, completion: nil)
        }

    }
    
    func isValidEmailAddr(email: String) -> Bool {
      let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1

      let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2

      return emailValidationPredicate.evaluate(with: email)  // 3
    }
    
}
