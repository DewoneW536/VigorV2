//
//  LoginViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/2/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    //@IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
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
        Utilities.styleTextField(emailTextField);
        Utilities.styleTextField(passwordTextField);
        Utilities.styleFilledButton(loginButton);
        passwordTextField.isSecureTextEntry = true; //This should make password just dots in textField
    }

    func validateFields()->String?{
        if(emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            return "Please do not leave any fields empty"
        }
        return nil;
    }
    func showError(_ message: String){
        errorLabel.text = message;
        errorLabel.alpha = 1;
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        //Validate Text Field entries:
        let error = validateFields();
        if(error != nil){
            //Found an error in one of the fields
            //will show error message here:
            showError(error!);
        }
        
        //Create cleaned up textField strings (i.e. no whitespaces) -
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
        //sign in the user
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if error != nil{
                self.errorLabel.text = error!.localizedDescription;
                self.errorLabel.alpha = 1;
            }
            else{
                let tabBarViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? TabBarViewController
                
                self.view.window?.rootViewController = tabBarViewController;
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
