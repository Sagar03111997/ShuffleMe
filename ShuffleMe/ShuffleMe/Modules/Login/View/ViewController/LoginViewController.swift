//
//  ViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 10/22/22.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var horizontalScrollView: UIView!
    
    var images: [String] = ["Login1", "Login2", "Login3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewSetup()
        doInitialSetup()
    }
    
    func pageViewSetup() {
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imageView)
            
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func doInitialSetup() {
        scrollView.layer.cornerRadius = 15
//        btnSingUp.layer.cornerRadius = 20.0
//        btnSignIn.layer.cornerRadius = 20.0
//        btnSignIn.layer.borderWidth = 1
//        btnSignIn.layer.borderColor = ColorConstants.MainThemeColorConstants.primaryThemeColor.cgColor
//        btnSingUp.tintColor = ColorConstants.MainThemeColorConstants.secondaryLegendColor
//        btnSignIn.tintColor = ColorConstants.MainThemeColorConstants.primaryThemeColor
//        
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "SignUp", bundle: nil)
        guard let signUn = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        signUn.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        signUn.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(signUn, animated: false, completion: nil)
        
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "SignIn", bundle: nil)
        guard let signIn = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signIn.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        signIn.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(signIn, animated: false, completion: nil)
        
//        let storyboard = UIStoryboard.init(name: "Profile", bundle: nil)
//        guard let signIn = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
//        signIn.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        signIn.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(signIn, animated: false, completion: nil)
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size
            .width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
}

