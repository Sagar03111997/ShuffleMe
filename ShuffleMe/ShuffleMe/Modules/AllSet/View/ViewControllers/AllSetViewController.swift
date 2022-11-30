//
//  AllSetViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/25/22.
//

import UIKit

class AllSetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let delay : Double = 1.0    // 5 seconds here
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let storyboard = UIStoryboard.init(name: "TabBar", bundle: nil)
            guard let signUn = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else { return }
            signUn.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            signUn.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(signUn, animated: false, completion: nil)
        }

    }
    

}
