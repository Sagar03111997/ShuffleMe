//
//  UtilityMethods.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/25/22.
//

import Foundation
import UIKit

///The class is for helper methods.
class UtilityMethods: NSObject {
    static let sharedInstance = UtilityMethods()
    private override init() {}
    
    func underLineText() {
        let underLine: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    // MARK: UIALertView methods
    func showSimpleAlertViewWith(alertTitle: String, alertMessage: String) {
        var dialogMessage = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        dialogMessage.addAction(ok)
        UtilityMethods.runAfterDelay(0.3, block: {
            var topViewController = UIApplication.shared.windows.first?.rootViewController
            while (topViewController!.presentedViewController) != nil {
                topViewController = topViewController!.presentedViewController
            }
            topViewController?.present(dialogMessage, animated: true, completion: nil)
        })
    }
    
    class func runAfterDelay(_ delay: TimeInterval, block: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    }
}
