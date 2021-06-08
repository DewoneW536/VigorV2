//
//  ViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIGraphicsBeginImageContext(self.view.frame.size);
        UIImage(named: "signInBackgroundImage")?.draw(in: self.view.bounds);
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext();
            self.view.backgroundColor = UIColor(patternImage: image);
        }
        else{
            UIGraphicsEndImageContext();
            print("Image unavailable!");
        }
        setUpElements();
    }
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton);
        Utilities.styleHollowButton(loginButton)
    }

}

