//
//  Utilities.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/3/21.
//

import Foundation
import UIKit

//In this class, I am going to pass in textFields, buttons, etc. and style them within the class.

class Utilities{
    static func styleTextField(_ textField: UITextField){
        let bottomLine = CALayer();
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height-2, width: textField.frame.width, height: 2);
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 102/255, alpha: 1).cgColor;
        textField.borderStyle = .none;
        textField.layer.addSublayer(bottomLine);
    }
    static func styleFilledButton(_ button:UIButton){
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1);
        button.layer.cornerRadius = 25.0;
        button.tintColor = UIColor.white;
    }
    static func styleHollowButton(_ button: UIButton){
        button.layer.borderWidth = 2;
        button.layer.borderColor = UIColor.white.cgColor;
        button.layer.cornerRadius = 25.0;
        button.tintColor = UIColor.white;
    }
    //This function will take password validity against a regular expressions/semantical pattern
    static func isPasswordValid(_ password: String)-> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}");
        return passwordTest.evaluate(with: password);
    }
}
